import "@typespec/http";

// Response utilities
model PagedResult<ItemResponseDto> {
    items: ItemResponseDto[];
    totalCount: int32;
    pageNumber: int32;
    pageSize: int32;
}

// Custom response models

using TypeSpec.Http;

model AppOkResponse<ItemDto> {
    ...OkResponse;
    ...Body<ItemDto>;
}
