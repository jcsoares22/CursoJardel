using System.ComponentModel.DataAnnotations;
using System.Globalization;

namespace ReservaSalao.Api.Configs;

public class RequiredEnumAttribute : ValidationAttribute
{
    private readonly Type _enumType;

    public RequiredEnumAttribute(Type enumType)
    {
        /*if (!enumType.IsEnum)
        {
            throw new ArgumentException("Type must be an enumeration");
        }*/

        _enumType = enumType;
    }

    protected override ValidationResult IsValid(object? value, ValidationContext validationContext)
    {
        if (value == null)
        {
            return new ValidationResult(FormatErrorMessage(validationContext.DisplayName));
        }

        if (value is string stringValue)
        {
            if (Enum.TryParse(_enumType, stringValue, true, out _))
            {
                return ValidationResult.Success!;
            }
        }
        else if (Enum.IsDefined(_enumType, value))
        {
            return ValidationResult.Success!;
        }

        return new ValidationResult(FormatErrorMessage(validationContext.DisplayName));
    }

    public override string FormatErrorMessage(string name)
    {
        return string.Format(CultureInfo.CurrentCulture, ErrorMessageString, name, _enumType.Name);
    }
}
