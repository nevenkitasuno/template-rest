import "@typespec/http";

using TypeSpec.Http;

model CommonParameters {
    @header
    clientVersion?: string;
}