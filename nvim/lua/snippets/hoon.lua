local ls = require("luasnip")
local s = ls.s
local i = ls.i
local t = ls.t
local d = ls.dynamic_node
local c = ls.choice_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {}

local group = vim.api.nvim_create_augroup("Lua Snippets", { clear = true })
local file_pattern = "*.lua"

local function cs(trigger, nodes, opts)
end

ls.add_snippets("hoon", {
    -- dot runes
    s("dotlus", fmt([[ .+  {} ]], { i(1) })),
    s("dotwut", fmt([[ .?  {} ]], { i(1) })),
    s("dotket",
        fmt([[
            .^
            {}
            ==
        ]], { i(1) })),
    s("dottar", fmt([[ 
        .*  {}
        {}
    ]], { i(1), i(2) })),
    s("dottis", fmt([[ 
        .=  {}
        {}
    ]], { i(1), i(2) })),
    -- zap runes
    s("zapdot", fmt([[ !.  {} ]], { i(1) })),
    s("zapcol", fmt([[ !:  {} ]], { i(1) })),
    s("zaptis", fmt([[ !=  {} ]], { i(1) })),
    s("zapgar", fmt([[ !>({} {}) ]], { i(1), i(2) })),
    s("zapgal", fmt([[ !<({} {}) ]], { i(1), i(2) })),
    s("zapwut", fmt([[ 
        !@  {}
          {}
        {}
    ]], { i(1), i(2), i(3) })),
    s("zapcom", fmt([[ 
        !,  {}
        {}
    ]], { i(1), i(2) })),
    s("zapmic", fmt([[ 
        !;  {}
        {}
    ]], { i(1), i(2) })),
    -- tis runes
    s("tisgar", fmt([[ 
        =>  {}
        {}
    ]], { i(1), i(2) })),
    s("tisbar", fmt([[ 
        =|  {}
        {}
    ]], { i(1), i(2) })),
    s("tiscol", fmt([[ 
        =: 
        {} {}
        ==
        {}
    ]], { i(1), i(2), i(3) })),
    s("tiscom", fmt([[ 
        =,  {}
        {}
    ]], { i(1), i(2) })),
    s("tisdot", fmt([[ 
        =.  {}  {}
        {}
    ]], { i(1), i(2), i(3) })),
    s("tishep", fmt([[ 
        =-  {}
        {}
    ]], { i(1), i(2) })),
    s("tisket", fmt([[ 
        =^  {}  {}
          {}
        {}
    ]], { i(1), i(2), i(3), i(4) })),
    s("tisgal", fmt([[ 
        =<  {}
        {}
    ]], { i(1), i(2) })),
    s("tislus", fmt([[ 
        =+  {}
        {}
    ]], { i(1), i(2) })),
    s("tismic", fmt([[ 
        =+  {}
          {}
        {}
    ]], { i(1), i(2), i(3) })),
    s("tisfas", fmt([[ 
        =/  {}
          {}
        {}
    ]], { i(1), i(2), i(3) })),
    s("tissig", fmt([[ 
        =~  {}
            {}
        ==
    ]], { i(1), i(2) })),
    s("tistar", fmt([[ 
        =*  {}
          {}
        {}
    ]], { i(1), i(2), i(3) })),
    s("tiswut", fmt([[ 
        =?  {}  {}
          {}
        {}
    ]], { i(1), i(2), i(3), i(4) })),
    -- wut runes
    -- bar runes
    s("barket", fmt([[
        |^
        {}
        --
    ]], { i(1) })),
    -- lus runes
    -- col runes
    -- cen runes
    -- ket runes
    -- buc runes
    -- mic runes
    -- sig runes
    -- fas runes
    -- gall agent template
    s("gall-agent", fmt([[ 
        /+  default-agent, dbug
        |%
        +$  versioned-state
          $%  state-0
          ==
        +$  state-0  [%0 {}]
        +$  card  card:agent:gall
        --
        %-  agent:dbug
        =|  state-0
        =*  state  -
        ^-  agent:gall
        |_  =bowl:gall
        +*  this  .
            def   ~(. (default-agent this %.n) bowl)
        ++  on-init
          ^-  (quip card _this)   
          `this
        ++  on-save
          ^-  vase
          !>(state)
        ++  on-load
          |=  old-state=vase
          ^-  (quip card _this)   
          =/  old  !<(versioned-state old-state)
          ?-  -.old
            %0  `this(state old)
          ==
        ++  on-poke
          |=  [=mark =vase]
          ^-  (quip card _this)
          |^
          ?>  =(src.bowl our.bowl)
          ?+  mark  (on-poke:def mark vase)
            %{}-action
              =^  cards  state
                (handle-poke !<(action:{} vase))
              [cards this]
          ==
          ++  handle-poke
            |=  =action:nex
            ^-  (quip card _state)
            ::  Switch on action `mark`
            ?-  -.action
            %{}
                :_  state
                :~  
                :* 
                  %give 
                  %fact 
                  ~[/updates] 
                  %{}-update 
                  !>(`update:{}]`[]
                ==
            %{}
                {}
            ==
          --
        ++  on-watch  on-watch:def
        ++  on-leave  on-leave:def
        ++  on-peek   on-peek:def
        ++  on-agent  on-agent:def
        ++  on-arvo   on-arvo:def
        ++  on-fail   on-fail:def
        --
    ]], { i(1), i(2), i(3), i(4), i(5), i(6), i(7), i(8) }))
})

