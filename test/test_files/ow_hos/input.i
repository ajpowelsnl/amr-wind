#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#            SIMULATION STOP            #
#.......................................#
time.stop_time               =   50     # Max (simulated) time to evolve
time.max_step                =   10

#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#         TIME STEP COMPUTATION         #
#.......................................#
time.initial_dt = -0.1
time.fixed_dt         =   0.25        # Use this constant dt if > 0
time.cfl              =   0.45         # CFL factor
time.use_force_cfl= false
#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#            INPUT AND OUTPUT           #
#.......................................#
time.plot_interval            =  10       # Steps between plot files
time.checkpoint_interval      =  -10       # Steps between checkpoint files
io.output_default_fields = 0
io.outputs = density velocity p vof ow_levelset ow_velocity
incflo.initial_iterations = 3
incflo.do_initial_proj = 1
OceanWaves.label = "HOS1"
OceanWaves.HOS1.type = "HOSWaves"
OceanWaves.HOS1.HOS_files_prefix = "HOSGridData"
OceanWaves.HOS1.relax_zone_gen_length=900
OceanWaves.HOS1.relax_zone_out_length=900

#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#               PHYSICS                 #
#.......................................#
incflo.use_godunov = 1
incflo.godunov_type="weno"
incflo.mflux_type="minmod"
transport.model = TwoPhaseTransport
transport.viscosity_fluid1=0.0 #1.0e-3
transport.viscosity_fluid2=0.0 #1.8e-5
transport.laminar_prandtl = 0.7
transport.turbulent_prandtl = 0.3333
turbulence.model = Laminar 

incflo.physics = MultiPhase OceanWaves
MultiPhase.density_fluid1=1000
MultiPhase.density_fluid2=1.25
ICNS.source_terms = GravityForcing 
MultiPhase.verbose=0
#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#        ADAPTIVE MESH REFINEMENT       #
#.......................................#
amr.n_cell              = 64 64 16
amr.blocking_factor = 2
amr.max_level = 1
tagging.labels = sr         
tagging.sr.type = CartBoxRefinement                         
tagging.sr.static_refinement_def = static_box.refine
#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#              GEOMETRY                 #
#.......................................#
geometry.prob_lo        =     0.0  0.0  -1000   # Lo corner coordinates
geometry.prob_hi        =     9.3717632253682877E+03 9.3717632253682877E+03 200  # Hi corner coordinates
geometry.is_periodic    =     1     1     0   # Periodicity x y z (0/1)

#xlo.type =   "slip_wall"
#xhi.type =   "slip_wall"
#xlo.vof_type = "zero_gradient"
#xhi.vof_type = "zero_gradient"

#xlo.type = "mass_inflow"
#xlo.velocity = 0.0 0.0 0.0
#xlo.levelset = -1.0
#xlo.density = 1.0
#xlo.vof = 0.0
#xhi.type = "mass_inflow"
#xhi.velocity = 0.0 0.0 0.0
#xhi.levelset = -1.0
#xhi.density = 1.0
#xhi.vof = 0.0

zlo.type =   "slip_wall"
zhi.type =   "slip_wall"
zhi.density_type = "zero_gradient"
zlo.density_type = "zero_gradient"
zlo.vof_type = "zero_gradient"
zhi.vof_type = "zero_gradient"
