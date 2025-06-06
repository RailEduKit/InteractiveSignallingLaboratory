# Interactive Signalling Laboratory

## About
The Interactive Signalling Laboratory is a comprehensive educational toolkit for railway signalling systems. This repository serves as a meta-repository that brings together various components of the project, including 3D models, and documentation.

## Modules
The project consists of several 📦 submodules:

| Module | Description | Purpose |
|--------|-------------|---------|
| [📖 handbook](https://github.com/RailEduKit/SigLab-handbook) | Signalling exercises and learning materials | Contains how to use the laboratory with exercises |
| [🌐 website](https://github.com/RailEduKit/SigLab-Website) | Web-based documentation | Howto construct the Interactive Signalling Laboratory |
| [🏗️ papercut](https://github.com/RailEduKit/SigLab-Papercut) | Paper-based objects | For prototyping and testing |
| [🏗️ 3d-models](https://github.com/RailEduKit/SigLab-3Dmodels) | 3D printable models | Signalling equipment for wooden train sets |

## Getting Started

### Cloning the Repository
To clone this repository with all its submodules, use:

```bash
git clone --recursive https://github.com/RailEduKit/InteractiveSignallingLaboratory.git
cd InteractiveSignallingLaboratory
```

If you've already cloned the repository without submodules, you can initialize them with:

```bash
git submodule init
git submodule update
```

### Working with Individual Components
Each component can be used independently:

1. **Papercut**
   - Navigate to the `papercut` directory
   - Follow the instructions in its README for printing and using the materials

2. **3D Models**
   - Access the `3d-models` directory
   - Use the provided STL files with your 3D printer
   - Check the `website` for assembly instructions

3. **Handbook**
   - The `handbook` directory contains how to use the laboratory with exercises
   - Includes tutorials and reference materials

4. **Website**
   - The `website` directory contains the web interface
   - Follow the setup instructions in its README for local development

## Contributing
We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on how to contribute to this project. You can also check our [issues](https://github.com/RailEduKit/InteractiveSignallingLaboratory/issues) to see what needs to be done or to report bugs. Check out our [contributors](https://github.com/RailEduKit/SigLab-Website/blob/main/CONTRIBUTORS.md) to see who has helped make this project possible.

## Roadmap
- [ ] Make handbook multilingale
- [ ] Extend with train numbers
- [ ] Extend with dispatching
- [ ] Extend with simulations of malfunctions and disruptions

## License
This project is licensed under the terms included in the [LICENSE](LICENSE) file.

## Citation
If you use this project in your research or teaching, please cite it using the information in [CITATION.cff](CITATION.cff).