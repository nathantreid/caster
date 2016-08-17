from dragonfly import (Grammar, AppContext, MappingRule,
                       Dictation, IntegerRef, Key)

from caster.lib import settings
from caster.lib.dfplus.additions import IntegerRefST
from caster.lib.dfplus.state.short import R


from caster.lib.dfplus.merge.mergerule import MergeRule
from caster.lib import control


class CommandRule(MergeRule):
    pronunciation = "web storm"

    mapping = {
        "duplicate":                R(Key("c-d"), rdescript="WebStorm: Duplicate"),
        "auto complete":            R(Key("cs-enter"), rdescript="WebStorm: Auto Complete"),
        "format code":              R(Key("ca-l"), rdescript="WebStorm: Format Code"),
        "show doc":                 R(Key("c-q"), rdescript="WebStorm: Show Documentation"),
        "show param":               R(Key("c-p"), rdescript="WebStorm: Show Parameters"),
        "Jen method":               R(Key("a-insert"), rdescript="WebStorm: Generated Method"),
        "jump to source":           R(Key("f4"), rdescript="WebStorm: Jump To Source"),
        "delete line":              R(Key("c-y"), rdescript="WebStorm: Delete Line"),
        "search symbol":            R(Key("cas-n"), rdescript="WebStorm: Search Symbol"),
        "debug":                    R(Key("s-f9"), rdescript="WebStorm: Debug"),
        "run":                      R(Key("s-f10"), rdescript="WebStorm: Run"),
        "next tab":                 R(Key("a-right"), rdescript="WebStorm: Next Tab"),
        "prior tab":                R(Key("a-left"), rdescript="WebStorm: Previous Tab"),

        "comment line":             R(Key("c-slash"), rdescript="WebStorm: Comment Line"),
        "comment block":            R(Key("cs-slash"), rdescript="WebStorm: Uncomment Line"),
        "select ex":                R(Key("c-w"), rdescript="WebStorm: untitled command"),
        "select ex down":           R(Key("cs-w"), rdescript="WebStorm: entitled command"),
        "search everywhere":        R(Key("shift, shift"), rdescript="WebStorm: Search Everywhere"),
        "find in path":             R(Key("cs-f"), rdescript="WebStorm: Find In Path"),
        "go to line":               R(Key("c-g"), rdescript="WebStorm: Go To Line"),

        "toggle terminal":          R(Key("a-f12"), rdescript="WebStorm: Toggle Terminal"),
        "toggle project":           R(Key("a-1"), rdescript="WebStorm: Toggle Project"),
        }
    extras = [
              Dictation("text"),
              Dictation("mim"),
              IntegerRefST("n", 1, 1000),

             ]
    defaults = {"n": 1, "mim":""}

#---------------------------------------------------------------------------

context = AppContext(executable="WebStorm", title="WebStorm") \
          | AppContext(executable="WebStorm64", title="WebStorm")
grammar = Grammar("WebStorm", context=context)
grammar.add_rule(CommandRule(name="webstorm"))
if settings.SETTINGS["apps"]["webstorm"]:
    if settings.SETTINGS["miscellaneous"]["rdp_mode"]:
        control.nexus().merger.add_global_rule(CommandRule())
    else:
        grammar.load()