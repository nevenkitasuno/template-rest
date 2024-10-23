import "@typespec/json-schema";

import "./common/okResponseTemplates.tsp";

// add fields to fulfill specific entity only here
model TemplateEntityUpsertDto {
    @maxLength(42)
    templateData: string;
}

model TemplateEntityResponseDto extends TemplateEntityUpsertDto {
    id: TypeSpec.JsonSchema.Format.uuid; // here can change Id type
}

model TemplateEntityPagedResultResponse {
    ...AppOkResponse<{...PagedResult<TemplateEntityResponseDto>}>
}

model TemplateEntityOkResponse {
    ...AppOkResponse<TemplateEntityResponseDto>
}