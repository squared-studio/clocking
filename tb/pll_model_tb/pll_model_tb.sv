// Description here
// Author : Foez Ahmed (foez.official@gmail.com)
// This file is part of squared-studio:clocking
// Copyright (c) 2025 squared-studio
// Licensed under the MIT License
// See LICENSE file in the project root for full license information


module pll_model_tb;

  `define ENABLE_DUMPFILE

  //////////////////////////////////////////////////////////////////////////////////////////////////
  //-IMPORTS
  //////////////////////////////////////////////////////////////////////////////////////////////////

  // bring in the testbench essentials functions and macros
  `include "vip/tb_ess.sv"

  //////////////////////////////////////////////////////////////////////////////////////////////////
  //-LOCALPARAMS
  //////////////////////////////////////////////////////////////////////////////////////////////////

  //////////////////////////////////////////////////////////////////////////////////////////////////
  //-TYPEDEFS
  //////////////////////////////////////////////////////////////////////////////////////////////////

  //////////////////////////////////////////////////////////////////////////////////////////////////
  //-SIGNALS
  //////////////////////////////////////////////////////////////////////////////////////////////////

  // generates static task start_clk_i with tHigh:4ns tLow:6ns
  `CREATE_CLK(fref_i, 5ns, 5ns)

  logic       bypass_i = 0;
  logic [7:0] refdiv_i = 2;
  logic       lock_o;
  logic [15:0] fbdiv_i = 60;
  logic       fvco_o;
  logic [7:0] fdiv_i = 3;
  logic       fout_o;


  //////////////////////////////////////////////////////////////////////////////////////////////////
  //-RTLS
  //////////////////////////////////////////////////////////////////////////////////////////////////

  pll_model #() u_pll (
      .bypass_i(bypass_i),
      .fref_i  (fref_i),
      .refdiv_i(refdiv_i),
      .lock_o  (lock_o),
      .fbdiv_i (fbdiv_i),
      .fvco_o  (fvco_o),
      .fdiv_i  (fdiv_i),
      .fout_o  (fout_o)
  );

  //////////////////////////////////////////////////////////////////////////////////////////////////
  //-METHODS
  //////////////////////////////////////////////////////////////////////////////////////////////////

  //////////////////////////////////////////////////////////////////////////////////////////////////
  //-PROCEDURALS
  //////////////////////////////////////////////////////////////////////////////////////////////////

  initial begin
    start_fref_i();

    wait(lock_o == 1);
    #10us;
    $finish;
  end

endmodule
