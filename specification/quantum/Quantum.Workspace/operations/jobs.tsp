// --------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// --------------------------------------------------------------------------------------------

import "./operations.tsp";

using TypeSpec.Rest;
using TypeSpec.Versioning;

using TypeSpec.Http;
using OpenAPI;

/** The type of the job. */
union JobType {
  string,

  /** Unknown job type. */
  Unknown: "Unknown",

  /** Quantum Computing job type. */
  QuantumComputing: "QuantumComputing",

  /** Optimization job type. */
  Optimization: "Optimization",
}

/** The status of the job. */
union JobStatus {
  string,

  /** The job is waiting in the queue to be executed. */
  Waiting: "Waiting",

  /** The job is being executed. */
  Executing: "Executing",

  /** The job completed with success. */
  Succeeded: "Succeeded",

  /** The job completed with failure. */
  Failed: "Failed",

  /** The job was cancelled. */
  Cancelled: "Cancelled",
}

/** Quantum computing data. */
model QuantumComputingData {
  /** The number of quantum computing items in the job. */
  @visibility(Lifecycle.Read)
  count: int64;
}

/** A job to be run in the workspace. */
@resource("jobs")
@parentResource(QuantumWorkspace)
model JobDetails extends ItemDetails {
  /** Id of the job. */
  #suppress "@azure-tools/typespec-azure-core/key-visibility-required" "False-positive"
  @key("jobId")
  @visibility(Lifecycle.Read)
  id: WorkspaceItemId;

  /** Type of the Quantum Workspace item is Job. */
  @visibility(Lifecycle.Read, Lifecycle.Create)
  itemType: ItemType.Job;

  /** The type of job. */
  @visibility(Lifecycle.Read, Lifecycle.Create)
  jobType?: JobType;

  /** The ID of the session that the job is part of. */
  @visibility(Lifecycle.Read, Lifecycle.Create)
  sessionId?: string;

  /** The blob container SAS uri, the container is used to host job data. */
  @visibility(Lifecycle.Read, Lifecycle.Create)
  containerUri: string;

  /** The input blob URI, if specified, it will override the default input blob in the container. */
  @visibility(Lifecycle.Read, Lifecycle.Create)
  inputDataUri?: string;

  /** The format of the input data. */
  @visibility(Lifecycle.Read, Lifecycle.Create)
  inputDataFormat?: string;

  /** The status of the job. */
  @visibility(Lifecycle.Read)
  status?: JobStatus;

  /** The job metadata. Metadata provides client the ability to store client-specific information */
  @visibility(Lifecycle.Read, Lifecycle.Create, Lifecycle.Update)
  metadata?: {};

  /** The time when a job was successfully cancelled. */
  @visibility(Lifecycle.Read)
  cancellationTime?: utcDateTime;

  /** List of user-supplied tags associated with the job. */
  @visibility(Lifecycle.Read, Lifecycle.Create, Lifecycle.Update)
  tags?: string[];

  /** Quantum computing data. */
  @visibility(Lifecycle.Read)
  quantumComputingData?: QuantumComputingData;

  /** The input parameters for the job. JSON object used by the target solver. It is expected that the size of this object is small and only used to specify parameters for the execution target, not the input data. */
  @visibility(Lifecycle.Read, Lifecycle.Create)
  inputParams?: {};

  /** The output blob uri. When a job finishes successfully, results will be uploaded to this blob. */
  @visibility(Lifecycle.Read, Lifecycle.Create)
  outputDataUri?: string;

  /** The format of the output data. */
  @visibility(Lifecycle.Read, Lifecycle.Create)
  outputDataFormat?: string;
}

/** A Paged List of JobDetails. */ // Used by workspace/jobs and sesssions/{sessionId}/jobs
alias PagedJobDetails = Azure.Core.Page<JobDetails>;

@useDependency(DefaultAzureCoreVersion)
namespace Quantum.Workspace.Operations {
  using Quantum.Workspace.BaseOperations;
  interface JobOperations {
    /** Create a new job. */
    #suppress "@azure-tools/typespec-azure-core/use-standard-names" "Existing name"
    create is CreateOperation<JobDetails>;

    /** Update job properties. */
    #suppress "@azure-tools/typespec-azure-core/use-standard-operations" """
      There is no support for JsonPatch in Azure.Core.
      The Azure.Core.ResourceUpdate does not support NoContentResponse and the JsonPatchDocument request body.
      See https://github.com/Azure/typespec-azure/issues/475
      """
    update is PatchOperation<JobDetails>;

    /** Request the cancellation of an existing job. */
    #suppress "@azure-tools/typespec-azure-core/use-standard-names" "Existing name"
    cancel is CancelOperation<JobDetails>;

    /** Get job by its id. */
    get is GetOperation<JobDetails>;

    /** List all jobs. */
    #suppress "@azure-tools/typespec-azure-core/use-standard-operations" """
      We had to use a custom ResourceList to avoid an autoroute bug for workspace/jobs and sesssions/{sessionId}/jobs.
      See https://github.com/Azure/typespec-azure/issues/494
      """
    list is CustomListOperation<
      Resource = JobDetails,
      Response = PagedJobDetails
    >;
  }
}
