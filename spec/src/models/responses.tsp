import "@typespec/http";

import "./errors.tsp";
import "./appModels.tsp";

// Custom response models

using TypeSpec.Http;

model AppNotFoundResponse {
    ...NotFoundResponse;
    ...Body<NotFoundError>;
}

model AppUnauthorizedResponse {
    ...UnauthorizedResponse;
    ...Body<UnauthorizedError>;
  }

model InternalServerErrorResponse {
    @statusCode statusCode: 500;
    @body error: InternalServerError;
}

model TemplateEntityPagedResultResponse {
    ...OkResponse;
    ...Body<TemplateEntityPagedResult>;
}
