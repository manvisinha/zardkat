pragma circom 2.0.0;

/*This circuit template checks that c is the multiplication of a and b.*/  

template Multiplier2 () {  
   signal input A0;
   signal input B1;

   signal X;
   signal Y;

   signal output Q;

   component andGate=AND();
   component orGate=OR();
   component notGate=NOT();

   andGate.a <== A0 ;
   andGate.b <== B1 ;
   X <== andGate.out ;

   notGate.in <== B1 ;
   Y <== notGate.out;

   orGate.a <== X;
   orGate.b <== Y;
   Q <== orGate.out;

}

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

component main = Multiplier2();
