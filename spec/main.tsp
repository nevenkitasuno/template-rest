import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";
import "@typespec/json-schema";

import "./src/models/responses.tsp";
import "./src/models/request.tsp";

using TypeSpec.Http;
@service({
    title: "Template Service",
})
@server("https://template-example.com", "Template server endpoint")
namespace TemplateService;

@route("/TemplateEntity")
namespace TemplateEntity {
    @useAuth(BearerAuth)
    @get
    op listTemplateEntities(
        ...CommonParameters,
    ): TemplateEntityPagedResultResponse | InternalServerErrorResponse;

    @useAuth(BearerAuth) // omit this decorator and InternalServerErrorResponse if don't want auth for method
    @get
    op getTemplateEntity(
        @path id: TypeSpec.JsonSchema.Format.uuid,
        ...CommonParameters,
    ):
        | AppNotFoundResponse
        | AppUnauthorizedResponse
        | InternalServerErrorResponse
        | {
              @statusCode statusCode: 200;
              @body templateEntity: TemplateEntityResponseDto;
          };

    @useAuth(BearerAuth)
    @post
    op createTemplateEntity(
        @body templateEntityUpsertDto: TemplateEntityUpsertDto,
        ...CommonParameters,
    ): InternalServerErrorResponse | AppUnauthorizedResponse | {
        @statusCode statusCode: 201;
        @body newTemplateEntity: TemplateEntityResponseDto;
    };

    @useAuth(BearerAuth)
    @put
    op updateTemplateEntity(
        @path id: TypeSpec.JsonSchema.Format.uuid,
        @body templateEntityUpsertDto: TemplateEntityUpsertDto,
        ...CommonParameters,
    ):
        | AppNotFoundResponse
        | AppUnauthorizedResponse
        | InternalServerErrorResponse
        | {
              @statusCode statusCode: 200;
              @body updatedTemplateEntity: TemplateEntityResponseDto;
          }
        | {
              @statusCode statusCode: 400;
              @body error: ValidationError;
          }
        | {
              @statusCode statusCode: 500;
              @body error: InternalServerError;
          };

    @useAuth(BearerAuth)
    @delete
    op deleteTemplateEntity(
        @path id: TypeSpec.JsonSchema.Format.uuid,
        ...CommonParameters,
    ):
        | AppNotFoundResponse
        | InternalServerErrorResponse
        | AppUnauthorizedResponse
        | {
              @statusCode statusCode: 204;
          };
}
