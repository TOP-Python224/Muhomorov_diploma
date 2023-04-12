from enum import IntEnum


class GroupNumber(IntEnum):
    MASTER = 1
    ACCEPTOR = 2
    MANAGER = 3


class StatusNumber(IntEnum):
    WORKED = 1
    ORDERED = 2
    ENDED = 3
    ACCEPTED = 6
