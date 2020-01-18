-- initially, "helios.api" is the only function in our entire Lua sandbox.  We call it to tell HeliosExport16 that
-- we want version 16 of the API.  if it fails and returns false, we exit.  If it succeeds, then it will set up an export16 
-- sandbox and we continue.  Future versions can support multiple different
-- environments easily and we can disallow running drivers that ask for an API we don't have.  Any driver that does
-- not ask for an API will automatically fail (we catch via pcall) because it accesses some other function that does
-- not exist in the initial sandbox.
if not helios.api("export16") then return end

-- example of accessing local state
local localState = { counter = 1 }

-- install value via a function call instead of setting a variable, so we can detect errors directly where they happen.
-- We can install multiple ones, just so the same file can service multiple airplanes.  depending on implementation, user may need
-- to copy the file to multiple paths by aircraft name.
helios.addSupportedVehicle("FA-18C_hornet")

-- install table via a function call instead of setting a variable, so we can detect errors directly where they happen
-- 0 is the main panel device
helios.exportEveryTick(0, {
    [298] = "%0.1f",
    [299] = "%0.1f",
    [300] = "%0.1f",
    [301] = "%0.1f",
    [302] = "%0.1f",
    [303] = "%0.1f",
    [304] = "%0.1f",
    [305] = "%0.1f",
    [306] = "%0.1f",
    [307] = "%0.1f",
    [308] = "%0.1f",
    [309] = "%0.1f",
    [13] = "%0.1f",
    [10] = "%0.1f",
    [15] = "%0.1f",
    [16] = "%0.1f",
    [17] = "%0.1f",
    [18] = "%0.1f",
    [19] = "%0.1f",
    [20] = "%0.1f",
    [21] = "%0.1f",
    [22] = "%0.1f",
    [23] = "%0.1f",
    [24] = "%0.1f",
    [25] = "%0.1f",
    [29] = "%0.1f",
    [26] = "%0.1f",
    [31] = "%0.1f",
    [32] = "%0.1f",
    [38] = "%0.1f",
    [39] = "%0.1f",
    [40] = "%0.1f",
    [41] = "%0.1f",
    [33] = "%0.1f",
    [34] = "%0.1f",
    [35] = "%0.1f",
    [36] = "%0.1f",
    [37] = "%0.1f",
    [152] = "%0.1f",
    [154] = "%0.1f",
    [156] = "%0.1f",
    [158] = "%0.1f",
    [160] = "%0.1f",
    [166] = "%0.1f",
    [165] = "%0.1f",
    [167] = "%0.1f",
    [163] = "%0.1f",
    [164] = "%0.1f",
    [162] = "%0.1f",
    [1] = "%0.1f",
    [2] = "%0.1f",
    [3] = "%0.1f",
    [47] = "%0.1f",
    [48] = "%0.1f",
    [45] = "%0.1f",
    [44] = "%0.1f",
    [294] = "%0.1f",
    [376] = "%0.1f",
    [137] = "%0.1f",
    [4] = "%0.1f",
    [5] = "%0.1f",
    [6] = "%0.1f",
    [460] = "%0.1f",
    [461] = "%0.1f",
    [462] = "%0.1f",
    [464] = "%0.1f",
    [465] = "%0.1f",
    [466] = "%0.1f",
    [467] = "%0.1f",
    [810] = "%0.1f",
    [463] = "%0.1f",
    [273] = "%0.1f",
    [274] = "%0.1f",
    [270] = "%0.1f",
    [271] = "%0.1f",
    [267] = "%0.1f",
    [268] = "%0.1f",
    [264] = "%0.1f",
    [265] = "%0.1f",
    [520] = "%0.1f",
    [516] = "%0.1f",
    [468] = "%0.1f",
    [469] = "%0.1f",
    [2056] = "%0.1f",
    [2057] = "%0.1f",
    [2058] = "%0.1f",
    [2060] = "%0.1f",
    [4000] = "%0.1f",
    [4001] = "%0.1f",
    [4002] = "%0.1f",
    [4003] = "%0.1f",
    [4004] = "%0.1f",
    [4005] = "%0.1f",
    [4006] = "%0.1f",
    [4007] = "%0.1f",
    [4008] = "%0.1f",
    [4009] = "%0.1f",
    [4010] = "%0.1f",
    [4011] = "%0.1f",
    [4012] = "%0.1f",
    [4013] = "%0.1f",
    [4014] = "%0.1f",
    [4015] = "%0.1f",
    [4016] = "%0.1f",
    [4017] = "%0.1f",
    [4018] = "%0.1f",
    [287] = "%.4f",
    [286] = "%.4f",
    [288] = "%0.1f",
    [289] = "%0.1f",
    [290] = "%0.1f",
    [205] = "%.4f",
    [206] = "%.4f",
    [209] = "%0.1f",
    [207] = "%.4f",
    [208] = "%.4f",
    [225] = "%.4f",
    [217] = "%.4f",
    [285] = "%.4f",
    [242] = "%0.2f",
    [310] = "%.4f",
    [311] = "%.4f",
    [400] = "%.4f",
    [401] = "%.4f",
    [2029] = { "%0.2f;%0.2f;%0.4f", 29, 30, 31 },
    [2051] = { "%0.4f;%0.4f;%0.4f", 220, 219, 218 },
    [2059] = { "%0.2f;%0.2f;%0.3f", 223, 222, 221 }  -- Helios should generate comments for all these
})

helio.exportReducedRate(0, {
    [345] = "%.3f",
    [346] = "%1d",
    [349] = "%1d",
    [348] = "%0.1f",
    [347] = "%0.1f",
    [234] = "%0.1f",
    [139] = "%0.1f",
    [138] = "%0.1f",
    [470] = "%1d",
    [504] = "%.3f",
    [295] = "%0.1f",
    [296] = "%1d",
    [404] = "%0.1f",
    [402] = "%0.1f",
    [403] = "%0.1f",
    [379] = "%0.1f",
    [378] = "%0.1f",
    [336] = "%1d",
    [332] = "%1d",
    [333] = "%1d",
    [334] = "%1d",
    [335] = "%1d",
    [409] = "%0.1f",
    [410] = "%0.1f",
    [381] = "%0.1f",
    [382] = "%0.1f",
    [383] = "%0.1f",
    [384] = "%0.1f",
    [454] = "%0.1f",
    [455] = "%0.1f",
    [456] = "%0.1f",
    [457] = "%0.1f",
    [368] = "%1d",
    [375] = "%0.1f",
    [377] = "%1d",
    [331] = "%1d",
    [369] = "%0.1f",
    [226] = "%0.1f",
    [228] = "%1d",
    [229] = "%1d",
    [238] = "%0.1f",
    [233] = "%0.1f",
    [293] = "%0.1f",
    [241] = "%0.1f",
    [240] = "%0.1f",
    [340] = "%0.1f",
    [341] = "%0.1f",
    [344] = "%0.1f",
    [343] = "%0.1f",
    [342] = "%0.1f",
    [453] = "%1d",
    [43] = "%1d",
    [42] = "%1d",
    [510] = "%1d",
    [511] = "%0.1f",
    [513] = "%0.1f",
    [514] = "%1d",
    [260] = "%1d",
    [575] = "%1d",
    [338] = "%.3f",
    [337] = "%.3f",
    [339] = "%0.1f",
    [237] = "%0.1f",
    [413] = "%.3f",
    [414] = "%.3f",
    [415] = "%.3f",
    [419] = "%0.1f",
    [418] = "%.3f",
    [417] = "%.3f",
    [416] = "%0.1f",
    [14] = "%1d",
    [239] = "%0.1f",
    [365] = "%0.1f",
    [366] = "%.3f",
    [411] = "%0.1f",
    [412] = "%1d",
    [405] = "%0.1f",
    [408] = "%0.1f",
    [451] = "%.3f",
    [407] = "%.3f",
    [406] = "%.3f",
    [297] = "%0.1f",
    [452] = "%0.1f",
    [505] = "%.3f",
    [506] = "%.3f",
    [494] = "%0.1f",
    [458] = "%1d",
    [459] = "%1d",
    [49] = "%0.1f",
    [50] = "%1d",
    [258] = "%0.1f",
    [153] = "%1d",
    [155] = "%1d",
    [157] = "%1d",
    [159] = "%1d",
    [161] = "%1d",
    [235] = "%.1f",
    [236] = "%0.1f",
    [135] = "%0.1f",
    [46] = "%1d",
    [30] = "%1d",
    [11] = "%1d",
    [27] = "%1d",
    [140] = "%0.1f",
    [141] = "%.3f",
    [142] = "%0.1f",
    [143] = "%.3f",
    [144] = "%0.1f",
    [145] = "%.3f",
    [146] = "%.3f",
    [147] = "%0.1f",
    [148] = "%0.1f",
    [51] = "%0.1f",
    [52] = "%.3f",
    [53] = "%.3f",
    [54] = "%1d",
    [55] = "%1d",
    [56] = "%1d",
    [57] = "%1d",
    [58] = "%1d",
    [59] = "%1d",
    [60] = "%1d",
    [61] = "%1d",
    [62] = "%1d",
    [63] = "%1d",
    [64] = "%1d",
    [65] = "%1d",
    [66] = "%1d",
    [67] = "%1d",
    [68] = "%1d",
    [69] = "%1d",
    [70] = "%1d",
    [72] = "%1d",
    [73] = "%1d",
    [75] = "%1d",
    [76] = "%0.1f",
    [77] = "%.3f",
    [78] = "%.3f",
    [79] = "%1d",
    [80] = "%1d",
    [81] = "%1d",
    [82] = "%1d",
    [83] = "%1d",
    [84] = "%1d",
    [85] = "%1d",
    [86] = "%1d",
    [87] = "%1d",
    [88] = "%1d",
    [89] = "%1d",
    [90] = "%1d",
    [91] = "%1d",
    [92] = "%1d",
    [93] = "%1d",
    [94] = "%1d",
    [95] = "%1d",
    [96] = "%1d",
    [97] = "%1d",
    [98] = "%1d",
    [203] = "%.3f",
    [177] = "%1d",
    [179] = "%1d",
    [180] = "%1d",
    [182] = "%1d",
    [183] = "%1d",
    [184] = "%1d",
    [185] = "%1d",
    [186] = "%1d",
    [187] = "%1d",
    [188] = "%1d",
    [189] = "%1d",
    [190] = "%1d",
    [191] = "%1d",
    [192] = "%1d",
    [193] = "%1d",
    [194] = "%1d",
    [195] = "%1d",
    [196] = "%1d",
    [197] = "%1d",
    [198] = "%1d",
    [199] = "%1d",
    [200] = "%1d",
    [201] = "%1d",
    [202] = "%1d",
    [312] = "%1d",
    [313] = "%1d",
    [168] = "%1d",
    [169] = "%1d",
    [170] = "%1d",
    [171] = "%1d",
    [172] = "%1d",
    [173] = "%1d",
    [174] = "%.3f",
    [4019] = "%3.0f",
    [4020] = "%3.0f",
    [440] = "%0.1f",
    [443] = "%0.1f",
    [128] = "%1d",
    [129] = "%1d",
    [130] = "%1d",
    [131] = "%1d",
    [132] = "%1d",
    [133] = "%1d",
    [134] = "%1d",
    [100] = "%1d",
    [101] = "%1d",
    [102] = "%1d",
    [103] = "%1d",
    [106] = "%1d",
    [111] = "%1d",
    [112] = "%1d",
    [113] = "%1d",
    [114] = "%1d",
    [115] = "%1d",
    [116] = "%1d",
    [117] = "%1d",
    [118] = "%1d",
    [119] = "%1d",
    [120] = "%1d",
    [121] = "%1d",
    [122] = "%1d",
    [99] = "%1d",
    [110] = "%1d",
    [107] = "%0.1f",
    [108] = "%.3f",
    [123] = "%.3f",
    [109] = "%.3f",
    [124] = "%.3f",
    [126] = "%.3f",
    [125] = "%1d",
    [127] = "%1d",
    [357] = "%.3f",
    [358] = "%.3f",
    [359] = "%.3f",
    [360] = "%.3f",
    [361] = "%.3f",
    [362] = "%.3f",
    [363] = "%.3f",
    [364] = "%.3f",
    [350] = "%0.1f",
    [351] = "%0.1f",
    [356] = "%0.1f",
    [355] = "%0.1f",
    [354] = "%1d",
    [353] = "%0.1f",
    [352] = "%0.1f",
    [444] = "%0.1f",
    [445] = "%.3f",
    [446] = "%0.1f",
    [447] = "%0.1f",
    [230] = "%1d",
    [373] = "%0.1f",
    [374] = "%0.1f",
    [277] = "%1d",
    [275] = "%1d",
    [272] = "%1d",
    [269] = "%1d",
    [266] = "%1d",
    [263] = "%.3f",
    [262] = "%.3f",
    [261] = "%0.1f",
    [216] = "%.3f",
    [380] = "%1d",
    [517] = "%0.1f",
    [515] = "%1d",
    [175] = "%0.1f",
    [176] = "%0.1f",
    [314] = "%0.1f",
    [224] = "%.3f",
    [292] = "%.1f",
    [291] = "%.3f",
    [215] = "%1d"
})

-- install an anonymous function via a function call instead of setting a variable, so we can detect errors directly where they happen
helios.runEveryTick(function (mainPanelDevice)
    -- REVISIT: is there any point in making this code into some structured data instead?  the data would not be any shorter than the code
    -- running code in a strict sandbox is almost the same as parsing configuration, and this is certainly easier to read
    --
    -- the alternative would be something like
    -- [2092] = { "%2s", 6, "UFC_ScratchPadString1Display", helios.UFC.encodeString }

    -- getting the IFEI data
    local li = helios.parseIndication(5)
    if li then

        -- helios.send will send "" for nil, unless argument 4 specifies a value to use for nil
        -- if argument 5 is present, any non-nil values will be converted to that value (see "textures" below)
        helios.send("2052", li.txt_BINGO)
        helios.send("2053", li.txt_CLOCK_H)
        helios.send("2054", li.txt_CLOCK_M)
        helios.send("2055", li.txt_CLOCK_S)
        helios.send("2056", li.txt_DD_1)
        helios.send("2057", li.txt_DD_2)
        helios.send("2058", li.txt_DD_3)
        helios.send("2060", li.txt_DD_4)
        helios.send("2061", li.txt_FF_L)
        helios.send("2062", li.txt_FF_R)
        helios.send("2063", li.txt_FUEL_DOWN)
        helios.send("2064", li.txt_FUEL_UP)
        helios.send("2065", li.txt_OilPress_L)
        helios.send("2066", li.txt_OilPress_R)
        helios.send("2067", li.txt_RPM_L)
        helios.send("2068", li.txt_RPM_R)
        helios.send("2069", li.txt_TEMP_L)
        helios.send("2070", li.txt_TEMP_R)
        helios.send("2073", li.txt_TIMER_H)
        helios.send("2072", li.txt_TIMER_M)
        helios.send("2071", li.txt_TIMER_S)
        helios.send("2074", li.txt_Codes)
        helios.send("2075", li.txt_SP)
        helios.send("2076", li.txt_DrawChar) -- not seen this used
        helios.send("2077", li.txt_T)
        helios.send("2078", li.txt_TimeSetMode)
        --
        --        --IFEI textures
        --
        helios.send("4000", li.RPMTexture, "0", "1")
        helios.send("4001", li.TempTexture, "0", "1")
        helios.send("4002", li.FFTexture, "0", "1")
        helios.send("4003", li.NOZTexture, "0", "1")
        helios.send("4004", li.OILTexture, "0", "1")
        helios.send("4005", li.BINGOTexture, "0", "1")
        helios.send("4006", li.LScaleTexture, "0", "1")
        helios.send("4007", li.RScaleTexture, "0", "1")
        helios.send("4008", li.L0Texture, "0", "1")
        helios.send("4009", li.R0Texture, "0", "1")
        helios.send("4010", li.L50Texture, "0", "1")
        helios.send("4011", li.R50Texture, "0", "1")
        helios.send("4012", li.L100Texture, "0", "1")
        helios.send("4013", li.R100Texture, "0", "1")
        helios.send("4014", li.LPointerTexture, "0", "1")
        helios.send("4015", li.RPointerTexture, "0", "1")
        helios.send("4016", li.ZTexture, "0", "1")
        helios.send("4017", li.LTexture, "0", "1")
        helios.send("4018", li.RTexture, "0", "1")
    end

    -- getting the UFC data
    li = helios.parseIndication(6)
    if li then
        helios.send("2080", li.UFC_MainDummy)
        helios.send("2081", li.UFC_mask)
        helios.send("2082", li.UFC_OptionDisplay1)
        helios.send("2083", li.UFC_OptionDisplay2)
        helios.send("2084", li.UFC_OptionDisplay3)
        helios.send("2085", li.UFC_OptionDisplay4)
        helios.send("2086", li.UFC_OptionDisplay5)

        -- the exact encoding can change as we change Helios, so don't do it here
        -- NOTE: all this plane-specific escaping should not even be necessary.  we should deal with all these
        -- issues on the Helios side and just escape any strings that have issues in them automatically, regardless of source
        -- this also means "textures" would be sent as "" and "whatever they were" and then converted to boolean on Helios side
        -- at that point, we can make "export17" api and remove helios.fa18c from it
        helios.fa18c.ufc.sendOptionCueing("2087", li.UFC_OptionCueing1)
        helios.fa18c.ufc.sendOptionCueing("2088", li.UFC_OptionCueing2)
        helios.fa18c.ufc.sendOptionCueing("2089", li.UFC_OptionCueing3)
        helios.fa18c.ufc.sendOptionCueing("2090", li.UFC_OptionCueing4)
        helios.fa18c.ufc.sendOptionCueing("2091", li.UFC_OptionCueing5)

        -- the exact encoding can change as we change Helios, so don't do it here
        helios.fa18c.ufc.sendString("2092", "%2s", li.UFC_ScratchPadString1Display)
        helios.fa18c.ufc.sendString("2093", "%2s", li.UFC_ScratchPadString2Display)
        helios.fa18c.ufc.sendString("2094", "%7s", li.UFC_ScratchPadNumberDisplay)
        helios.fa18c.ufc.sendString("2095", "%2s", li.UFC_Comm1Display)
        helios.fa18c.ufc.sendString("2096", "%2s", li.UFC_Comm2Display)
    end
end)

-- alternatively, you can name the custom export function
helios.runReducedRate(reducedRateExport)    
local function reducedRateExport(mainPanelDevice) --luacheck: no unused args
    --- more exports...
end
