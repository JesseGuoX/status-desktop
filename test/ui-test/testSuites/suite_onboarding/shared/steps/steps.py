from pathlib import Path
import sys
from screens.StatusWelcomeScreen import CreatePasswordView

_welcome_screen = CreatePasswordView()


@When('the user inputs the password \"|any|\"')
def step(context, password):
    _welcome_screen.new_password = str(password)


@Then("the password strength indicator is \"|any|\"")
def step(context, strength):
    fp = Path(__file__).resolve().parent.parent / 'shared' / 'verificationPoints' / sys.platform / f'{strength}.png'

    # # saved it for updating expected results
    # import time
    # time.sleep(10)
    # fp.parent.mkdir(exist_ok=True, parents=True)
    # _welcome_screen.password_strength_indicator.save(str(fp))

    _welcome_screen.is_password_strength_indicator_equal(str(fp))

    