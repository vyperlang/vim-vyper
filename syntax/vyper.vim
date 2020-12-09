" Vim syntax file
" Language:             Vyper (https://github.com/vyperlang/vyper)
" Author:               chgue (https://github.com/chgue)
" URL:                  https://github.com/vyperlang/vim-vyper
" Last Change:          2020-10-10
" Filenames:            *.vy

if exists("b:current_syntax")
  finish
endif

"Keywords
syn keyword vyperNatspec @title @licence @author @notice @dev @param @return @version
syn keyword vyperImport implements from import
syn keyword vyperConstant ZERO_ADDRESS EMPTY_BYTES32 MAX_INT128 MIN_INT128 MAX_DECIMAL MIN_DECIMAL MAX_UINT256
syn keyword vyperEnvironment msg tx block
syn keyword vyperStatement struct event interface def nextgroup=vyperFunction skipwhite
syn keyword vyperRepeat for while in
syn keyword vyperConditional if else elif
syn keyword vyperSpecial return pass continue break log assert raise
syn keyword vyperOperator and not or
syn keyword vyperBoolean True False
syn keyword vyperStatement external internal nonreentrant pure view nonpayable payable
syn keyword vyperTypes address bool decimal num bytes32 int128 uint256
syn keyword vyperTypes Bytes String HashMap
syn keyword vyperBuiltin as_unitless_number as_wei_value bitwise_and bitwise_not bitwise_or bitwise_xor blockhash ceil concat
syn keyword vyperBuiltin convert create_with_code_of ecadd ecmul ecrecover extract32 floor keccak256 len max method_id min raw_call
syn keyword vyperBuiltin sha3 shift slice uint256_addmod uint256_mulmod
syn keyword vyperBuiltin indexed public constant
syn keyword vyperTodo TODO FIXME NOTE contained

"Functions
syn match vyperFunction "[a-zA-Z_][a-zA-Z0-9_]*" display contained
syn match vyperFunction "\w\+\ze(" display

"Operators
syn match vyperOperator "\(=\|+\|-\|*\|\/\|%\|!\|<\|>\)"

"Decorators
syn match vyperDecorator "@" display nextgroup=vyperDecoratorName skipwhite
syn match vyperDecoratorName "\(payable\|nonpayable\|view\|pure\|internal\|external\|nonreentrant\)$" display contained

"Natspec
syn match vyperNatspec "@\w\+" display nextgroup=vyperNatspec contained

"Comments
syn match vyperComment "#.*$" contains=vyperTodo,vyperNatspec

"Literals
syn match vyperNumber "\<\d\>" display
syn match vyperNumber "\<[1-9]\d\+\>" display
syn match vyperNumberError "\<0\d\+\>" display
syn match vyperAddress "\<0x\x\{40}\>" display
syn match vyperAddressError "\<0x\x\{0,39}\>" display
syn match vyperAddressError "\<0x\x\{41,}\>" display
syn match vyperAddressError "\<0x\x*\X\+.\+\>" display
syn match vyperDecimal "\<\d*\.\d\+\>" display
"String
syntax match vyperSpecial "\\\d\d\d\|\\."
syntax region vyperString start=+"+  skip=+\\\\\|\\"+  end=+"\|$+ contains=vyperSpecial
syntax region vyperString  start=+'+  skip=+\\\\\|\\'+  end=+'\|$+ contains=vyperSpecial

"Docstrings
syn region vyperString start=+[uU]\=\z('''\|"""\)+ end="\z1" contains=vyperTodo,vyperNatspec keepend

syn match vyperStringError +".\{-}'+ display
syn match vyperStringError +'.\{-}"+ display

"We need to sync at each def so that docstrings don't spill into other methods
syn sync match vyperSync grouphere NONE "^\%(def\)\s\+\h\w*\s*[(:]"

"Highlighting
hi link vyperStatement Statement
hi link vyperConditional Conditional
hi link vyperConstant Function
hi link vyperRepeat Repeat
hi link vyperOperator Operator
hi link vyperBoolean Boolean
hi link vyperDecorator Define
hi link vyperDecoratorName Function
hi link vyperNatspec Special
hi link vyperSpecial Special
hi link vyperEnvironment Boolean
hi link vyperComment Comment
hi link vyperTypes Type
hi link vyperNumber Number
hi link vyperAddress Number
hi link vyperAddressError Error
hi link vyperDecimal Float
hi link vyperFunction Function
hi link vyperBuiltin Function
hi link vyperStringError Error
hi link vyperString String
hi link vyperTodo todo
