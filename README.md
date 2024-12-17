# Numerical Solutions for PDEs

A MATLAB-based implementation of various numerical methods for solving the heat equation, comparing different approaches and their effectiveness.

## Implemented Methods

- **Total Implicit Method**: Unconditionally stable scheme
- **Rocha Algorithm**: Alternating direction approach
- **Three-Point Method**: Forward/central differences
- **DuFort-Frankel Method**: Enhanced stability explicit scheme
- **Crank-Nicolson Method**: Semi-implicit method

## Features

- Interactive parameter input (spatial/temporal step sizes)
- Boundary conditions: u(0,t) = e^t, u(1,t) = e^(1+t)
- Initial condition: u(x,0) = e^x
- Error analysis and visualization
- Solution comparison with analytical results

## Available Scripts

- `m0_Test.m`: Basic implementation
- `m2_Precise_Solution_Plot.m`: Exact solution visualization
- `m3_*_Solution_Plot.m`: Various numerical implementations

## Results

Includes visualization files for different step sizes:
- x=0.01, t=0.005
- x=0.02, t=0.01

