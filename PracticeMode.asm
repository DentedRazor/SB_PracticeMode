; Soul Blazer - Practice Mode
; Version: Alpha
; Author: DentedRazor
; Date: 2025-05-26
; Brief Description: Gives options to help with practice
; 
; 1. Updates Title Screen to indicate mode
; 2. Spells are 0-cost
;
; Planned Features for rest of Beta
; 1. Menu to enable/disable 0 magic/other features
; 2. Ability to change experience/level/copy saves
; 3. Ability to change level/location

if not(defined("initialized"))
    arch 65816
    lorom

    check title "SOULBLAZER - 1 USA   "

    !initialized = 1
endif

namespace practice_mode

;Constants

ADDR_ARR_TITLE_TEXT    = $02BB3C

ADDR_1ST_LAIR_MSTR_QTY = $01BA20

ADDR_COST_DESC_FLAME_BALL     = $02D963
ADDR_COST_DESC_LIGHT_ARROW    = $02D999
ADDR_COST_DESC_MAGIC_FLARE    = $02D9D5
ADDR_COST_DESC_ROTATOR        = $02DA14
ADDR_COST_DESC_SPARK_BOMBS    = $02DA46
ADDR_COST_DESC_FLAME_PILLAR_1 = $02DA80
ADDR_COST_DESC_FLAME_PILLAR_2 = $02DA81
ADDR_COST_DESC_TORNADO        = $02DAB3
ADDR_COST_DESC_PHOENIX        = $02DAE2

ADDR_COST_VAL_FLAME_BALL   = $00A16A
ADDR_COST_VAL_LIGHT_ARROW  = $00A17A
ADDR_COST_VAL_MAGIC_FLARE  = $00A18A
ADDR_COST_VAL_ROTATOR      = $00A3F0
ADDR_COST_VAL_SPARK_BOMBS  = $00A1A7
ADDR_COST_VAL_FLAME_PILLAR = $00A1B7
ADDR_COST_VAL_TORNADO      = $00A1C7
ADDR_COST_VAL_PHOENIX      = $009F95

ADDR_MAGIC_ARMOR_INC = $00DB98

; 1. Update Title screen
;ALL RIGHTS RESERVED -> Practice Mode Alpha
org ADDR_ARR_TITLE_TEXT
db $50, $72, $61, $63, $74, $69, $63, $65, $20, ;Magician
   $4D, $6F, $64, $65, $20, ;Mode
   $41, $6C, $70, $68, $61  ;Alpha

; 3. Spells are 0-cost
; Descriptions in Menu
org ADDR_COST_DESC_FLAME_BALL
db $30; 0

org ADDR_COST_DESC_LIGHT_ARROW
db $30; 0

org ADDR_COST_DESC_MAGIC_FLARE
db $30; 0

org ADDR_COST_DESC_ROTATOR 
db $30; 0

org ADDR_COST_DESC_SPARK_BOMBS
db $30; 0

org ADDR_COST_DESC_FLAME_PILLAR_1
db $30; 0

org ADDR_COST_DESC_FLAME_PILLAR_2
db $40; Blank

org ADDR_COST_DESC_TORNADO
db $30; 0

org ADDR_COST_DESC_PHOENIX
db $30; 0
; Actual Costs
org ADDR_COST_VAL_FLAME_BALL
db $00

org ADDR_COST_VAL_LIGHT_ARROW
db $00

org ADDR_COST_VAL_MAGIC_FLARE
db $00

org ADDR_COST_VAL_ROTATOR
db $00

org ADDR_COST_VAL_SPARK_BOMBS
db $00

org ADDR_COST_VAL_FLAME_PILLAR
db $00

org ADDR_COST_VAL_TORNADO
db $00

org ADDR_COST_VAL_PHOENIX
db $00

;Prevent Magic Armor from incrementing cost to 0
org ADDR_MAGIC_ARMOR_INC
db $EA