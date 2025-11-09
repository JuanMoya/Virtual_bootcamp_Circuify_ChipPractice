v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 560 -120 580 -120 {lab=GND}
N 500 -120 520 -120 {lab=#net1}
N 560 -170 560 -150 {lab=#net2}
N 560 -250 560 -230 { lab=vd}
N 430 -120 430 -110 {lab=#net1}
N 430 -120 500 -120 {lab=#net1}
N 710 -140 710 -130 {lab=vd}
N 710 -70 710 -30 {lab=GND}
N 560 -250 710 -250 {lab=vd}
N 710 -250 710 -210 {lab=vd}
N 580 -120 610 -120 {lab=GND}
N 610 -120 610 -50 {lab=GND}
N 560 -50 610 -50 {lab=GND}
N 560 -90 560 -50 {lab=GND}
N 430 -50 430 -30 {lab=GND}
N 560 -50 560 -30 {lab=GND}
N 710 -210 710 -140 {lab=vd}
C {devices/code_shown.sym} -10 -310 0 0 {name=NGSPICE
only_toplevel=true
value="*
.option wnflag=1 
.option savecurrents
.control
save all
save @m.xm2.msky130_fd_pr__nfet_01v8[gm]
dc vd 0 1.8 0.005 vg 0 1.8 0.2
write test_nmos.raw

plot all.vd2#branch vs vd

set appendwrite
op
write test_nmos.raw

.endc
" }
C {devices/ammeter.sym} 560 -200 0 0 {name=Vd2  current=5.0094e-04}
C {sky130_fd_pr/nfet_01v8.sym} 540 -120 0 0 {name=M2
L=0.15
W=1
mult=1 nf=1
model=nfet_01v8
spiceprefix=X}
C {sky130_fd_pr/corner.sym} 510 -380 0 0 {name=CORNER only_toplevel=true corner=tt}
C {vsource.sym} 430 -80 0 0 {name=vg value=1.8 savecurrent=false}
C {gnd.sym} 430 -30 0 0 {name=l1 lab=GND}
C {vsource.sym} 710 -100 0 0 {name=vd value=1.8 savecurrent=false}
C {gnd.sym} 710 -30 0 0 {name=l2 lab=GND}
C {lab_wire.sym} 710 -250 0 1 {name=p1 sig_type=std_logic lab=vd}
C {gnd.sym} 560 -30 0 0 {name=l3 lab=GND}
