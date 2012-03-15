Deface::Override.new(:virtual_path => "spree/checkout/registration",
                     :name => "remove_guest_checkout_form",
                     :remove => "[data-hook='registration'] #guest_checkout, #registration[data-hook] #guest_checkout",
                     :disabled => false)