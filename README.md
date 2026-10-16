CDMA Encoder and Decoder Using Verilog HDL

📌 Project Overview

This project implements a Code Division Multiple Access (CDMA) encoder and decoder using Verilog Hardware Description Language (HDL).

The project demonstrates digital data processing, encoding and decoding logic, and simulation using Icarus Verilog and EDA Playground.

🎯 Objectives

- Design a CDMA encoder and decoder using Verilog HDL.
- Implement the required digital logic modules.
- Verify the design using a Verilog testbench.
- Observe input and output signals through simulation waveforms.

🛠️ Tools and Technologies

- HDL: Verilog
- Simulator: Icarus Verilog
- Online platform: EDA Playground
- Waveform viewer: EPWave
- Version control: GitHub

📂 Project Files

File| Description
"design.v"| Contains the CDMA design and supporting modules
"testbench.v"| Applies test inputs and observes the design output
"waveform.png"| Shows the simulation waveforms

⚙️ Design Modules

The design includes the following modules, as applicable to the source code:

- CDMA: Top-level module connecting the encoder and decoder.
- CDMAENCOD: Encoder logic.
- CDMADECOD: Decoder logic.
- network_interface: Network interface logic.
- OCI_crossbar: Crossbar logic.
- encoder: Majority-logic encoding module.
- processing_element: Processing and pipeline logic.

🧪 Simulation

The project was simulated using Icarus Verilog on EDA Playground.

The testbench applies a sequence of input data values and observes the corresponding output signals.

Test Input Values

- 98
- 77
- 43
- 57
- 86

The waveform can be used to observe the clock, input data, output data, and reset signals. The output timing may include pipeline delay.

📈 Simulation Waveform

"CDMA Simulation Waveform" (waveform.png)

▶️ How to Run

1. Open "EDA Playground" (https://www.edaplayground.com/).
2. Paste the contents of "design.v" into the Design panel.
3. Paste the contents of "testbench.v" into the Testbench panel.
4. Select Icarus Verilog as the simulator.
5. Run the simulation.
6. Open EPWave to inspect the waveforms.

🚀 Future Improvements

- Verify encoding and decoding for additional input patterns.
- Add automated checks to the testbench.
- Improve test coverage for reset and pipeline behavior.
- Integrate automated simulation with GitHub Actions.

👨‍💻 Author

Created as a Verilog HDL digital design project.

📄 License

This project is shared for educational and learning purposes.
