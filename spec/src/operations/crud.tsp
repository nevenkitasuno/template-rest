import "@typespec/http";
import "@typespec/json-schema";

import "../models/common/errorResponses.tsp";

using TypeSpec.Http;

interface CrudEndpoints<
    ItemOkResponse,
    PagedResultResponse,
    UpsertDto,
    ResponseDto,
    IdType,
    CommonParameters
> {
    @get
    listItems(
        @query pageNumber: int32,
        @query pageSize: int32,
        @query sort: string, // The field to sort by
        @query order: string, // enum The order of sorting ('asc' or 'desc').

        // plus query param named by field name and it's value is filter. Only for string fields
        ...CommonParameters,
    ): PagedResultResponse | AppUnauthorizedResponse | InternalServerErrorResponse;

    @get
    @route("{id}")
    getItem(@path id: IdType, ...CommonParameters):
        | AppNotFoundResponse
        | AppUnauthorizedResponse
        | InternalServerErrorResponse
        | ItemOkResponse;

    @post
    createItem(
        @body upsertDto: UpsertDto,
        ...CommonParameters,
    ): InternalServerErrorResponse | AppUnauthorizedResponse | {
        @statusCode statusCode: 201;
        @body newItem: ResponseDto;
    };

    @put
    @route("{id}")
    updateItem(
        @path id: TypeSpec.JsonSchema.Format.uuid,
        @body upsertDto: UpsertDto,
        ...CommonParameters,
    ):
        | AppNotFoundResponse
        | AppUnauthorizedResponse
        | InternalServerErrorResponse
        | ItemOkResponse
        | {
              @statusCode statusCode: 400;
              @body error: ValidationError;
          }
        | {
              @statusCode statusCode: 500;
              @body error: InternalServerError;
          };

    @delete
    @route("{id}")
    deleteItem(@path id: IdType, ...CommonParameters):
        | AppNotFoundResponse
        | InternalServerErrorResponse
        | AppUnauthorizedResponse
        | {
              @statusCode statusCode: 204;
          };
}
