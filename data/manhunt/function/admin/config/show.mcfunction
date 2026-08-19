# admin/config/show — put the assembled screen on the operator's display.
#
# Macro. Required key: d   (the whole dialog compound, from manhunt:tmp wrap)
# Call sites: admin/config/menu
#
# One line on purpose. See admin/config/menu for why the dialog cannot be written
# inline here: the Apply button's own $( ) would be eaten by this very substitution.

$dialog show @s $(d)
