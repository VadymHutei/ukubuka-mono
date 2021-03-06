import re

from vendor.Ukubuka.validator import UkubukaValidator


class UserValidator(UkubukaValidator):
    
    @staticmethod
    def password(password):
        if isinstance(password, str):
            return bool(re.fullmatch(r'[\w\W]{3,64}', password))
        return False