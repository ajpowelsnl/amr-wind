#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#            SIMULATION STOP            #
#.......................................#
time.stop_time               =   1     # Max (simulated) time to evolve
time.max_step                =   20          # Max number of time steps

#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#         TIME STEP COMPUTATION         #
#.......................................#
time.initial_dt = 0.01
time.fixed_dt         =   0.005        # Use this constant dt if > 0
time.cfl              =   0.45         # CFL factor
time.use_force_cfl= false
#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#            INPUT AND OUTPUT           #
#.......................................#
time.plot_interval            =  10       # Steps between plot files
time.checkpoint_interval      =  -1       # Steps between checkpoint files

#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#               PHYSICS                 #
#.......................................#
incflo.use_godunov = 1
incflo.godunov_type="weno_z"
transport.model = TwoPhaseTransport
transport.viscosity_fluid1=0.0
transport.viscosity_fluid2=0.0
transport.laminar_prandtl = 0.7
transport.turbulent_prandtl = 0.3333
turbulence.model = Laminar 

incflo.physics = MultiPhase OceanWaves 
OceanWaves.label = Wave1
OceanWaves.Wave1.type = LinearWaves
OceanWaves.Wave1.wave_height=0.02
OceanWaves.Wave1.wave_length=2.0
OceanWaves.Wave1.water_depth=1
OceanWaves.Wave1.relax_zone_gen_length=4.0
OceanWaves.Wave1.numerical_beach_length=8.0
MultiPhase.density_fluid1=1000.
MultiPhase.density_fluid2=1.
MultiPhase.interface_smoothing=0
MultiPhase.interface_smoothing_frequency=1
ICNS.source_terms = GravityForcing 
MultiPhase.verbose=1
#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#        ADAPTIVE MESH REFINEMENT       #
#.......................................#
amr.n_cell              = 480 16 32    # Grid cells at coarsest AMRlevel
amr.max_level = 0
#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#              GEOMETRY                 #
#.......................................#
geometry.prob_lo        =     0.0   0.  -1   # Lo corner coordinates
geometry.prob_hi        =     30.   1.   1  # Hi corner coordinates
geometry.is_periodic    =     0     1     0   # Periodicity x y z (0/1)

xlo.type =     "wave_generation"
xhi.type =     "slip_wall"
xlo.vof_type = "zero_gradient"
xhi.vof_type = "zero_gradient"

zlo.type =     "slip_wall"
zhi.type =     "slip_wall"
zlo.vof_type = "zero_gradient"
zhi.vof_type = "zero_gradient"

incflo.verbose=1

