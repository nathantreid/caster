'''
Created on Sep 2, 2015

@author: synkarius
'''
from dragonfly import Key, Text

from caster.lib import control
from caster.lib.ccr.standard import SymbolSpecs
from caster.lib.dfplus.additions import SelectiveAction
from caster.lib.dfplus.merge.mergerule import MergeRule, TokenSet
from caster.lib.dfplus.state.short import R


class ES6Plus(MergeRule):
    auto = [".js"]

    mapping = {

        # CCR PROGRAMMING STANDARD
        SymbolSpecs.IF: R(Text("if () {}") + Key("left, enter:2, up"), rdescript="Javascript: If"),
        SymbolSpecs.ELSE: R(Text("else {}") + Key("left, enter:2, up"), rdescript="Javascript: Else"),
        #
        SymbolSpecs.SWITCH: R(Text("switch() {}") + Key("left, enter:2, up"), rdescript="Javascript: Switch"),
        SymbolSpecs.CASE: R(Text("case :") + Key("left"), rdescript="Javascript: Case"),
        SymbolSpecs.BREAK: R(Text("break;"), rdescript="Break"),
        SymbolSpecs.DEFAULT: R(Text("default: "), rdescript="Javascript: Default"),
        #
        SymbolSpecs.DO_LOOP: R(Text("do {}") + Key("left, enter:2"), rdescript="Javascript: Do Loop"),
        SymbolSpecs.WHILE_LOOP: R(Text("while ()") + Key("left"), rdescript="Javascript: While"),
        SymbolSpecs.FOR_LOOP: R(Text("for (let i=0; i<VALUE; i++)"), rdescript="Javascript: For i Loop"),
        SymbolSpecs.FOR_EACH_LOOP: R(Text("for (VARIABLE in OBJECT)"), rdescript="Javascript: For Each Loop"),
        #
        SymbolSpecs.TO_INTEGER: R(Text("parseInt()") + Key("left"), rdescript="Javascript: Convert To Integer"),
        SymbolSpecs.TO_FLOAT: R(Text("parseFloat()") + Key("left"), rdescript="Javascript: Convert To Floating-Point"),
        SymbolSpecs.TO_STRING: R(Key("dquote, dquote, plus"), rdescript="Javascript: Convert To String"),
        #
        SymbolSpecs.AND: R(Text(" && "), rdescript="Javascript: And"),
        SymbolSpecs.OR: R(Text(" || "), rdescript="Javascript: Or"),
        SymbolSpecs.NOT: R(Text("!"), rdescript="Javascript: Not"),
        #
        SymbolSpecs.SYSOUT: R(Text("console.log()") + Key("left"), rdescript="Javascript: Print"),
        SymbolSpecs.IMPORT: R(Text("import "), rdescript="Java: Import"),
        SymbolSpecs.FUNCTION: R(Text("function NAME() {};") + Key("left:2, enter")
                                + SelectiveAction(Key("enter, up"), ["AptanaStudio3.exe"]),
                                rdescript="Javascript: Function"),

        SymbolSpecs.CLASS: R(Text("class NAME {}") + Key("left:2"), rdescript=""),

        SymbolSpecs.COMMENT: R(Text("//"), rdescript="Javascript: Add Comment"),
        SymbolSpecs.LONG_COMMENT: R(Text("/**/") + Key("left,left"), rdescript="Javascript: Long Comment"),
        #
        SymbolSpecs.NULL: R(Text("null"), rdescript="Javascript: Null"),
        #
        SymbolSpecs.RETURN: R(Text("return "), rdescript="Javascript: Return"),
        #
        SymbolSpecs.TRUE: R(Text("true"), rdescript="Javascript: True"),
        SymbolSpecs.FALSE: R(Text("false"), rdescript="Javascript: False"),

        # JavaScript specific
        "anon funk": R(Text("function () {}") + Key("left:1, enter")
                       + SelectiveAction(Key("enter, up"), ["AptanaStudio3.exe"]),
                       rdescript="Javascript: Anonymous Function"),
        "lambda": R(Text("() => "), rdescript="Javascript: Lambda"),
        "timer": R(Text("setInterval()") + Key("left"), rdescript="Javascript: Timer"),
        "timeout": R(Text("setTimeout()") + Key("left"), rdescript="Javascript: Timeout"),
        "document": R(Text("document"), rdescript="Javascript: Document"),
        "index of": R(Text("indexOf()") + Key("left"), rdescript="Javascript: Index Of"),
        "has own property": R(Text("hasOwnProperty()") + Key("left"), rdescript="Javascript: Has Own Property"),
        "length": R(Text("length"), rdescript="Javascript: Length"),
        "self": R(Text("self"), rdescript="Javascript: Self"),
        "push": R(Text("push"), rdescript="Javascript: Push"),
        "inner HTML": R(Text("innerHTML"), rdescript="Javascript: InnerHTML"),
        "new new": R(Text("new "), rdescript="Javascript: New"),
        "continue": R(Text("continue"), rdescript="Javascript: Continue"),

        "this": R(Text("this"), rdescript="Javascript: This"),
        "try": R(Text("try {}") + Key("left, enter:2, up"), rdescript="Javascript: Try"),
        "catch": R(Text("catch(e) {}") + Key("left, enter:2, up"), rdescript="Javascript: Catch"),

        "throw": R(Text("throw "), rdescript="Javascript: Throw"),
        "instance of": R(Text("instanceof "), rdescript="Javascript: Instance Of"),

        "let var": R(Text("let "), rdescript="Javascript: Let"),
        "con var": R(Text("con "), rdescript="Javascript: Constant"),
        "(far | variable)": R(Text("var "), rdescript="Javascript: Variable"),
        "sue iffae": R(Text("if ()") + Key("left"), rdescript="Javascript: Short If"),
        "sue shells": R(Text("else") + Key("enter"), rdescript="Javascript: Short Else"),

        "shell iffae": R(Text("else if ()") + Key("left"), rdescript="Javascript: Else If"),

    }

    extras = []
    defaults = {}

    token_set = TokenSet(["abstract", "arguments", "boolean", "break", "byte",
                          "case", "catch", "char", "class", "const", "continue",
                          "debugger", "default", "delete", "do", "double", "else",
                          "enum", "eval", "export", "extends", "false", "final",
                          "finally", "float", "for", "function", "goto", "if",
                          "implements", "import", "in", "instanceof", "int",
                          "interface", "let", "long", "native", "new", "null",
                          "package", "private", "protected", "public", "return",
                          "short", "static", "super", "switch", "synchronized",
                          "this", "throw", "throws", "transient", "true", "try",
                          "typeof", "var", "void", "volatile", "while", "with",
                          "yield"],
                         "//",
                         ["/*", "*/"])


control.nexus().merger.add_global_rule(Javascript(ID=200))