import typing

import configs
import names
import object
import squish
import test


class BaseElement:

    def __init__(self, object_name):
        self.symbolic_name = object_name
        self.object_name = getattr(names, object_name)
    
    def __str__(self): 
        return f'{type(self).__qualname__}({self.symbolic_name})' 

    @property
    def object(self):
        return squish.waitForObject(self.object_name)
    
    @property
    def existent(self):
        return squish.waitForObjectExists(self.object_name)

    @property
    def bounds(self) -> squish.UiTypes.ScreenRectangle:
        return object.globalBounds(self.object)

    @property
    def width(self) -> int:
        return int(self.bounds.width)

    @property
    def height(self) -> int:
        return int(self.bounds.height)

    @property
    def center(self) -> squish.UiTypes.ScreenPoint:
        return self.bounds.center()

    @property
    def is_selected(self) -> bool:
        return self.object.selected

    @property
    def is_visible(self) -> bool:
        try:
            return squish.waitForObject(self.object_name, 0).visible
        except (AttributeError, LookupError, RuntimeError):
            return False
    
    @property
    def image(self) -> squish.Image:
        return object.grabScreenshot(self.object)

    def click(
            self,
            x: typing.Union[int, squish.UiTypes.ScreenPoint] = None,
            y: typing.Union[int, squish.UiTypes.ScreenPoint] = None,
            button: squish.MouseButton = None
    ):
        squish.mouseClick(
            self.object,
            x or self.width // 2,
            y or self.height // 2,
            button or squish.MouseButton.LeftButton
        )

    def wait_until_appears(self, timeout_msec: int = configs.squish.UI_LOAD_TIMEOUT_MSEC):
        assert squish.waitFor(lambda: self.is_visible, timeout_msec), f'Object {self} is not visible'
        return self

    def wait_until_hidden(self, timeout_msec: int = configs.squish.UI_LOAD_TIMEOUT_MSEC):
        squish.waitFor(lambda: not self.is_visible, timeout_msec), f'Object {self} is not hidden'

    def wait_for_image(
            self,
            fp: str,
            tolerant: bool = True,
            threshold: int = 99.5,
            min_scale: int = 50,
            max_scale: int = 200,
            multiscale: bool = True,
            timeout_msec: int = squish.testSettings.waitForObjectTimeout
    ) -> squish.UiTypes.ScreenRectangle:
        try:
            squish.waitForImage(
                fp,
                {
                    'tolerant': tolerant,
                    'threshold': threshold,
                    'minScale': min_scale,
                    'maxScale': max_scale,
                    'multiscale': multiscale,
                    'timeout': timeout_msec
                },
                self.object
            )
        except LookupError as err:
            test.attachImage(squish.Image.load(fp), f'Image not found in/not equals to')
            raise err
