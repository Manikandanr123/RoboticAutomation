from robot.api import deco
from robot.libraries.BuiltIn import BuiltIn

@deco.library
class Shop:

    def __init__(self):
        # Do not access SeleniumLibrary here
        pass

    def _sel(self):
        # Lazy lookup when a keyword runs
        return BuiltIn().get_library_instance("SeleniumLibrary")

    @deco.keyword
    def hello_world(self):
        BuiltIn().log_to_console("hello")
        BuiltIn().log("hello")

    @deco.keyword
    def add_items_to_cart_and_checkout(self, *products):
        # products is a tuple of items when called with @{listofProducts}
        sel = self._sel()
        i = 1
        products_titles = sel.get_webelements("css:.inventory_item_name")
        wanted = set(products)  # faster lookups
        for products_title in products_titles:
            if products_title.text in wanted:
                sel.click_button(f"xpath:(//*[@class='btn btn_primary btn_small btn_inventory '])[{i}]")
            i += 1
        sel.click_link("css:.shopping_cart_link")

