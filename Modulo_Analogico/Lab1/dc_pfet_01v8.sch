v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 690 -130 690 -30 {
lab=GND}
N 690 -270 690 -190 {
lab=#net1}
N 590 -270 590 -190 {
lab=#net1}
N 410 -270 410 -250 {
lab=#net1}
N 540 -270 590 -270 {
lab=#net1}
N 590 -270 690 -270 {
lab=#net1}
N 480 -270 480 -190 {
lab=#net1}
N 410 -270 480 -270 {
lab=#net1}
N 410 -190 410 -160 {
lab=#net2}
N 410 -160 440 -160 {
lab=#net2}
N 480 -160 540 -160 {
lab=#net1}
N 540 -270 540 -160 {
lab=#net1}
N 480 -270 540 -270 {
lab=#net1}
N 480 -130 480 -110 {
lab=vd}
N 480 -30 590 -30 {
lab=#net3}
N 590 -130 590 -30 {
lab=#net3}
N 480 -110 480 -90 {lab=vd}
C {devices/vsource.sym} 410 -220 0 0 {name=Vgs value=0.9}
C {devices/vsource.sym} 590 -160 0 0 {name=Vds value=1.8}
C {devices/ammeter.sym} 480 -60 0 0 {name=vd2}
C {devices/ngspice_probe.sym} 510 -30 0 0 {name=r1}
C {devices/ngspice_probe.sym} 410 -160 0 0 {name=r3}
C {devices/vsource.sym} 690 -160 0 0 {name=Vdd value=1.8}
C {devices/gnd.sym} 690 -30 0 0 {name=l4 lab=GND}
C {sky130_fd_pr/corner.sym} 450 -440 0 0 {name=CORNER only_toplevel=true corner=tt}
C {sky130_fd_pr/pfet3_01v8.sym} 460 -160 0 0 {name=M8
L=0.15
W=1
nf=1 mult=1
model=pfet_01v8
spiceprefix=X
body=B}
C {devices/code_shown.sym} -10 -370 0 0 {name=NGSPICE only_toplevel=true 
value="
.option wnflag=1 
.option savecurrents
.control
save all
save @m.xm8.msky130_fd_pr__nfet_01v8[gm]
dc Vds 0 1.8 0.005 Vgs 0 1.8 0.2
write test_pmos.raw

plot all.vd2#branch vs vd

set appendwrite
op
write test_pmos.raw

.endc
"}
C {lab_wire.sym} 480 -100 0 1 {name=p1 sig_type=std_logic lab=vd}
