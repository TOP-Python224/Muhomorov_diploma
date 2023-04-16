from enum import IntEnum


class GroupNumber(IntEnum):
    """
    Описывает группы авторизованных пользователей.
    """
    MASTER = 1
    ACCEPTOR = 2
    MANAGER = 3


class StatusNumber(IntEnum):
    """
    Описывает статусы ремонтов.
    """
    WORKED = 1
    ORDERED = 2
    ENDED = 3
    ACCEPTED = 6
