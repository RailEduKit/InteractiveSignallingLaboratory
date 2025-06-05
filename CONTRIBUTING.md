# Contributing to Interactive Signalling Laboratory

Thank you for your interest in contributing to the Interactive Signalling Laboratory project! This document provides guidelines and instructions for contributing to this project.

## Project Structure

This project uses Git submodules to manage several components:

- `papercut/`: Contains the Papercut application
- `3d-models/`: Contains 3D models for the project
- `handbook/`: Contains the project handbook
- `website/`: Contains the project website

## Getting Started

### Prerequisites

- Git
- Basic understanding of Git submodules
- Required development tools for the specific component you're working on

### Initial Setup

1. Clone the main repository:
   ```bash
   git clone https://github.com/RailEduKit/InteractiveSignallingLaboratory.git
   cd InteractiveSignallingLaboratory
   ```

2. Initialize and update submodules:
   ```bash
   git submodule init
   git submodule update
   ```

### Working with Submodules

#### Cloning with Submodules

If you're cloning the repository for the first time, you can clone with submodules in one command:
```bash
git clone --recursive https://github.com/RailEduKit/InteractiveSignallingLaboratory.git
```

#### Updating Submodules

To update all submodules to their latest commits:
```bash
git submodule update --remote
```

#### Making Changes to Submodules

1. Navigate to the submodule directory:
   ```bash
   cd <submodule-name>
   ```

2. Create a new branch for your changes:
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. Make your changes and commit them:
   ```bash
   git add .
   git commit -m "Description of your changes"
   ```

4. Push your changes to the submodule repository:
   ```bash
   git push origin feature/your-feature-name
   ```

5. Create a pull request in the submodule repository

6. After the submodule changes are merged, update the main repository to point to the new submodule commit:
   ```bash
   cd ..
   git add <submodule-name>
   git commit -m "Update <submodule-name> to latest version"
   git push
   ```

## Development Workflow

1. Create a new branch for your feature or bugfix:
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. Make your changes and commit them following the commit message guidelines

3. Push your changes and create a pull request

## Commit Message Guidelines

- Use clear and descriptive commit messages
- Start with a verb in the present tense (e.g., "Add", "Fix", "Update")
- Keep the first line under 50 characters
- Provide more detailed explanation in the body if necessary

## Pull Request Process

1. Ensure your code follows the project's coding standards
2. Update documentation if necessary
3. Add tests for new features
4. Ensure all tests pass
5. Update the README.md if needed
6. Submit your pull request with a clear description of the changes

## Code of Conduct

Please be respectful and considerate of others when contributing to this project. We aim to foster an inclusive and welcoming community.

## License

By contributing to this project, you agree that your contributions will be licensed under the project's license. See the [LICENSE](LICENSE) file for details.

## Questions?

If you have any questions about contributing, please open an [issue](https://github.com/RailEduKit/InteractiveSignallingLaboratory/issues) in this repository.