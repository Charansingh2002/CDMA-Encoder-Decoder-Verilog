CDMA Encoder and Decoder Using Verilog HDL

📌 Project Overview

This project implements a Code Division Multiple Access (CDMA) encoder and decoder using Verilog Hardware Description Language (HDL).

It demonstrates digital data processing, encoding and decoding logic, and simulation using Icarus Verilog and EDA Playground.

🎯 Objectives

- Design a CDMA encoder and decoder using Verilog HDL.
- Implement the required digital logic modules.
- Verify the design using a Verilog testbench.
- Observe input and output signals through simulation waveforms.

🛠️ Tools and Technologies

- HDL: Verilog
- Simulator: Icarus Verilog
- Simulation Platform: EDA Playground
- Waveform Viewer: EPWave
- Version Control: GitHub

📂 Project Files

File| Description
"design.v"| Contains the CDMA design modules
"testbench.v"| Provides test inputs and observes outputs
"schematic.png"| Simulation waveform screenshot
"README.md"| Project documentation

⚙️ Design Modules

The design includes modules such as:

- CDMA: Top-level module connecting the encoder and decoder.
- CDMAENCOD: Encoder logic.
- CDMADECOD: Decoder logic.
- network_interface: Network interface logic.
- OCI_crossbar: Crossbar logic.
- encoder: Majority-logic encoding module.
- processing_element: Processing and pipeline logic.

🧪 Online Simulation

Run the CDMA Encoder and Decoder Verilog simulation on EDA Playground:

"Open EDA Playground Simulation" (https://www.edaplayground.com/x/NhFp)
The project was simulated using Icarus Verilog on EDA Playground.

Test Input Values

- 98
- 77
- 43
- 57
- 86

The testbench applies these input values and observes the output signals. Pipeline delays may affect when corresponding outputs appear.

📈 Simulation Waveform

The following image shows the simulation waveform captured from EPWave.

"CDMA Simulation Waveform" (schematic.png)

▶️ How to Run

1. Open "EDA Playground" (https://www.edaplayground.com/).
2. Copy the contents of "design.v" into the Design panel.
3. Copy the contents of "testbench.v" into the Testbench panel.
4. Select Icarus Verilog as the simulator.
5. Run the simulation.
6. Open EPWave to inspect the waveforms.

🚀 Future Improvements

- Test additional input patterns.
- Add automated output checks to the testbench.
- Improve reset and pipeline verification.
- Automate simulation using GitHub Actions.

📄 License

This project is shared for educational and learning purposes.
