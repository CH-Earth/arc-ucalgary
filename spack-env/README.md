# Spack Environment

The Spack environment is offered in the two `.yaml` and `.lock` files provided here.
The environment is fully "concretized" and ready to use.

# SLURM requirements

Given that the ARC HPC does not provide the header files for the SLURM, it was necessary
to obtain such files and provide them to the Spack environment. The following describes
such a process.

Firstly, the version of SLURM installed needs to be found out:
```console
[kasra.keshavarz1@arc spack-env]$ yum list installed | grep slurm                                                                                                                        
nvslurm-plugin-pyxis.x86_64               0.14.0-1.el8          @rcs-slurm
slurm.x86_64                              22.05.7-1.el8         @rcs-slurm
slurm-contribs.x86_64                     22.05.7-1.el8         @rcs-slurm
slurm-pam_slurm.x86_64                    22.05.7-1.el8         @rcs-slurm
slurm-perlapi.x86_64                      22.05.7-1.el8         @rcs-slurm
slurm-spank-private-tmpdir.x86_64         0.0.2-2               @rcs-slurm
```

Then, we should figure out where to obtain the exact same packages including
the `-devel` one including header files.
```console
$ yum whatprovides 'slurm*'                                                                                                                              
RCS repo rcs-appstream                                                                                                                                    65 MB/s |  10 MB     00:00 
RCS repo rcs-baseos                                                                                                                                       64 MB/s | 7.2 MB     00:00 
RCS repo rcs-epel                                                                                                                                         66 MB/s |  13 MB     00:00 
RCS repo rcs-epelmodular                                                                                                                                  32 MB/s | 733 kB     00:00 
RCS repo rcs-extras                                                                                                                                      1.2 MB/s |  14 kB     00:00 
RCS repo rcs-misclocal                                                                                                                                    15 MB/s | 231 kB     00:00 
RCS repo rcs-mlnx4                                                                                                                                        19 MB/s | 243 kB     00:00 
RCS repo rcs-powertools                                                                                                                                   58 MB/s | 2.8 MB     00:00 
RCS repo rcs-slurm                                                                                                                                       1.7 MB/s |  14 kB     00:00 

slurm-22.05.7-1.el8.x86_64 : Slurm Workload Manager
Repo        : @System
Matched from:
Provide    : slurm = 22.05.7-1.el8
Provide    : slurm(x86-64) = 22.05.7-1.el8

slurm-22.05.7-1.el8.x86_64 : Slurm Workload Manager
Repo        : rcs-slurm
Matched from:
Provide    : slurm(x86-64) = 22.05.7-1.el8
Provide    : slurm = 22.05.7-1.el8

slurm-contribs-22.05.7-1.el8.x86_64 : Perl tool to print Slurm job state information
Repo        : @System
Matched from:
Provide    : slurm-contribs = 22.05.7-1.el8
Provide    : slurm-contribs(x86-64) = 22.05.7-1.el8
slurm-contribs-22.05.7-1.el8.x86_64 : Perl tool to print Slurm job state information                                                                                                 

slurm-devel-22.05.7-1.el8.x86_64 : Development package for Slurm
Repo        : rcs-slurm
Matched from:
Provide    : slurm-devel = 22.05.7-1.el8
Provide    : slurm-devel(x86-64) = 22.05.7-1.el8

slurm-example-configs-22.05.7-1.el8.x86_64 : Example config files for Slurm
Repo        : rcs-slurm
Matched from:
Provide    : slurm-example-configs = 22.05.7-1.el8
Provide    : slurm-example-configs(x86-64) = 22.05.7-1.el8

slurm-libpmi-22.05.7-1.el8.x86_64 : Slurm\'s implementation of the pmi libraries
Repo        : rcs-slurm
Matched from:
Provide    : slurm-libpmi = 22.05.7-1.el8
Provide    : slurm-libpmi(x86-64) = 22.05.7-1.el8

slurm-openlava-22.05.7-1.el8.x86_64 : openlava/LSF wrappers for transition from OpenLava/LSF to Slurm
Repo        : rcs-slurm
Matched from:
Provide    : slurm-openlava = 22.05.7-1.el8
Provide    : slurm-openlava(x86-64) = 22.05.7-1.el8

slurm-pam_slurm-22.05.7-1.el8.x86_64 : PAM module for restricting access to compute nodes via Slurm
Repo        : @System
Matched from:
Provide    : slurm-pam_slurm = 22.05.7-1.el8
Provide    : slurm-pam_slurm(x86-64) = 22.05.7-1.el8

slurm-pam_slurm-22.05.7-1.el8.x86_64 : PAM module for restricting access to compute nodes via Slurm
Repo        : rcs-slurm
Matched from:
Provide    : slurm-pam_slurm = 22.05.7-1.el8
Provide    : slurm-pam_slurm(x86-64) = 22.05.7-1.el8

slurm-perlapi-22.05.7-1.el8.x86_64 : Perl API to Slurm
Repo        : @System
Matched from:
Provide    : slurm-perlapi = 22.05.7-1.el8
Provide    : slurm-perlapi(x86-64) = 22.05.7-1.el8

slurm-perlapi-22.05.7-1.el8.x86_64 : Perl API to Slurm
Repo        : rcs-slurm
Matched from:
Provide    : slurm-perlapi = 22.05.7-1.el8
Provide    : slurm-perlapi(x86-64) = 22.05.7-1.el8

slurm-slurmctld-22.05.7-1.el8.x86_64 : Slurm controller daemon
Repo        : rcs-slurm
Matched from:
Provide    : slurm-slurmctld = 22.05.7-1.el8
Provide    : slurm-slurmctld(x86-64) = 22.05.7-1.el8

slurm-slurmd-22.05.7-1.el8.x86_64 : Slurm compute node daemon
Repo        : rcs-slurm
Matched from:
Provide    : slurm-slurmd = 22.05.7-1.el8
Provide    : slurm-slurmd(x86-64) = 22.05.7-1.el8

slurm-slurmdbd-22.05.7-1.el8.x86_64 : Slurm database daemon
Repo        : rcs-slurm
Matched from:
Provide    : slurm-slurmdbd = 22.05.7-1.el8
Provide    : slurm-slurmdbd(x86-64) = 22.05.7-1.el8

slurm-spank-private-tmpdir-0.0.2-1.x86_64 : Slurm SPANK plugin for job private tmpdir
Repo        : rcs-slurm
Matched from:
Provide    : slurm-spank-private-tmpdir = 0.0.2-1
Provide    : slurm-spank-private-tmpdir(x86-64) = 0.0.2-1                                                                                                                                
slurm-spank-private-tmpdir-0.0.2-2.x86_64 : Slurm SPANK plugin for job private tmpdir
Repo        : @System
Matched from:
Provide    : slurm-spank-private-tmpdir = 0.0.2-2
Provide    : slurm-spank-private-tmpdir(x86-64) = 0.0.2-2

slurm-spank-private-tmpdir-0.0.2-2.x86_64 : Slurm SPANK plugin for job private tmpdir
Repo        : rcs-slurm
Matched from:
Provide    : slurm-spank-private-tmpdir = 0.0.2-2
Provide    : slurm-spank-private-tmpdir(x86-64) = 0.0.2-2

slurm-spank-private-tmpdir-0.0.3-2.x86_64 : Slurm SPANK plugin for job private tmpdir
Repo        : rcs-misclocal
Matched from:
Provide    : slurm-spank-private-tmpdir = 0.0.3-2
Provide    : slurm-spank-private-tmpdir(x86-64) = 0.0.3-2

slurm-torque-22.05.7-1.el8.x86_64 : Torque/PBS wrappers for transition from Torque/PBS to Slurm
Repo        : rcs-slurm
Matched from:
Provide    : slurm-torque = 22.05.7-1.el8
Provide    : slurm-torque(x86-64) = 22.05.7-1.el8
```

Upon knowing that these packages are available, we can proceed with downloading
and installing them locally (to the project space):
```console
[kasra.keshavarz1@arc arc-slurm]$ yum download --url slurm # only showing download links
Last metadata expiration check: 0:09:24 ago on Mon 09 Sep 2024 08:33:02 AM MDT.
http://alpha.rcs.ucalgary.ca/rocky-8.8/slurm/slurm-22.05.7-1.el8.x86_64.rpm
```
By removing the `--url` option, each package will be downloaded individually. For
installing:
```console
rpm2cpio slurm-torque-22.05.7-1.el8.x86_64 | cpio -idmv -D /work/comphyd_lab/local/
```

This is the gist of how I have overcome the limitations on ARC.

date: Monday, September 9th, 2024
