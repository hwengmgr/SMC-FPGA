//--------------------------------------------------------------
// This Program is  the Confidential and Proprietary product  of
// Cadence   Design     Systems,  Inc.  Any    unauthorized use,
// reproduction  or  transfer    of this program   is   strictly
// prohibited. Copyright (c)1992 by Cadence Design Systems, Inc.
// All Rights Reserv                                         ed.
//--------------------------------------------------------------
//   Title     :  edgesr.v
//   Libraries :  
//   Purpose   :  edge triggered set and reset flop
//   Limitation:  
//   Note      :  
//--------------------------------------------------------------
//  Modification History:
//   Oct 17 1994, 20:21	| <klein@bwise>: revision 1.0
//--------------------------------------------------------------
`timescale 1 ns / 1 ns

module edgesr (edgesrout, setedge, resetedge, reset);
input setedge, resetedge, reset;
output edgesrout;

reg detedge, clkedge;

wire edgesrout= detedge ^ clkedge;

// this module does a edge sensitive set/reset function.
// when clkedge and detedge are the same the output is zero.
// the edge of resetedge makes them the same. the edge of setedge
// makes them different.

always @(posedge resetedge or posedge reset) begin
 if (reset) clkedge = 0;
 else clkedge = detedge;
end

always @(posedge setedge or posedge reset) begin
 if (reset) detedge = 0;
 else detedge = ~clkedge;
end

endmodule
