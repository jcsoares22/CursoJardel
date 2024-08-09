using Microsoft.AspNetCore.Mvc;

namespace BlessAuth.CrossCutting;

public class Result<T>
{
    private readonly T? _value;
    public bool IsSuccess { get; }
    public bool IsFailure => !IsSuccess;
    public ProblemDetails? Error { get; } 

    private Result(T value)
    {
        _value = value;
        IsSuccess = true;
    }

    private Result(string error)
    {
        IsSuccess = false;
        Error = new ProblemDetails()
        {
            Title = error,
        };
    }

    public T Value
    {
        get
        {
            if (IsFailure)
            {
                throw new InvalidOperationException("Objeto possui uma falha");
            }
            return _value!;
        }
        private init => _value = value;
    }

    public static Result<T> Success(T value) => new(value);

    public static Result<T> Failure(string error) => new(error);
}
