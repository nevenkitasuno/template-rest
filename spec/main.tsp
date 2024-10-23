import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";
import "@typespec/json-schema";

import "./src/models/common/requestParameters.tsp";
import "./src/models/appModels.tsp";
import "./src/operations/crud.tsp";

using TypeSpec.Http;
@service({
    title: "Template Service",
})
@server("https://template-example.com", "Template server endpoint")
namespace TemplateService;

alias TemplateEntityCrud = CrudEndpoints<TemplateEntityOkResponse, TemplateEntityPagedResultResponse, TemplateEntityUpsertDto, TemplateEntityResponseDto, TypeSpec.JsonSchema.Format.uuid, VersionFromHeader>;

@route("/TemplateEntity")
namespace TemplateEntity {
    @useAuth(BearerAuth)
    op listTemplateEntities is TemplateEntityCrud.listItems;

    @useAuth(BearerAuth) // omit this decorator and InternalServerErrorResponse if don't want auth for method
    op getTemplateEntity is TemplateEntityCrud.getItem;

    @useAuth(BearerAuth)
    op createTemplateEntity is TemplateEntityCrud.createItem;

    @useAuth(BearerAuth)
    op updateTemplateEntity is TemplateEntityCrud.updateItem;

    @useAuth(BearerAuth)
    op deleteTemplateEntity is TemplateEntityCrud.deleteItem;
}
