@error
model ValidationError {
    code: "VALIDATION_ERROR";
    message: string;
    details: string[];
}

@error
model UnauthorizedError {
  code: "UNAUTHORIZED";
  message: string;
}

@error
model NotFoundError {
    code: "NOT_FOUND";
    message: string;
}

@error
model InternalServerError {
    code: string; // символьный или числовой код ошибки, в идеале выносится в справочник
    message: string; // понятное сообщение для пользователя в UI
    err: string; // сама ошибка, подробности в зависимости от среды
}