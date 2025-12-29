from cs50 import SQL


db = SQL("sqlite:///dont-panic.db")

password = input("Enter password: ")

db.execute(
    """ UPDATE users
    SET password = ?
    WHERE username = 'admin'; """
    , password
)

db.execute(
    """ DELETE FROM user_logs
    WHERE new_username = 'admin'
    AND new_password = ?; """
    , password
)
