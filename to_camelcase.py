def to_camelcase(str1):
    sp = str1.split('_')
    result = sp[0]
    for i in range(len(sp) - 1):
        result += sp[i + 1].capitalize()
    return result


def to_robot_space(str1):
    sp = str1.split('_')
    result = ''
    for s in sp:
        result += s.capitalize()
        result += ' '
    return result


def to_robot_variable(str1):
    to_camelcase(str1)
    return '${' + to_camelcase(str1) + '}'


a = 'click_sign_in_button'
print(to_camelcase(a))
print(to_robot_space(a))
print(to_robot_variable(a))
