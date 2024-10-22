import "@typespec/json-schema";

// add fields to fulfill specific entity only here
model TemplateEntityUpsertDto {
    @maxLength(42)
    templateData: string;
}

model TemplateEntityResponseDto extends TemplateEntityUpsertDto {
    id: TypeSpec.JsonSchema.Format.uuid;
}

model TemplateEntityPagedResult {
    items: TemplateEntityResponseDto[];
    totalCount: int32;
    pageNumber: int32;
    pageSize: int32;
}