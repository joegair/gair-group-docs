---
layout: default
title: DFT on MSU High Performance Computing
parent: Computation
nav_order: 4
has_toc: false
summary: "submit DFT jobs to HPC at MSU"
permalink: /page/computation/dft-msu-hpc.html
---


# {{page.title}}
{: .no_toc }


This tutorial will demonstrate how to get a high performance computing (HPC) account at MSU, how to get access to ORCA and Gaussian on HPC, and how to submit DFT calculations on HPC. The goal is for this tutorial to be accessible to folks with no coding experience. Download the neccessary submission script and input files [here](https://github.com/joegair/gair-group-docs/tree/main/assets/data/20240410_first_hpc_job/download).
{: .fs-6 .fw-300 .text-justify}


## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}


-----

# **"Request Permissions"**

First get an MSU HPC account by following the instructions [here](https://docs.icer.msu.edu/obtain_an_hpcc_account/). Then use the following links to request HPC access to [ORCA](https://contact.icer.msu.edu/licensing) and [Gaussian](https://icer.msu.edu/about/announcements/quantum-chemistry-package-gaussian). Note that Gaussian access can take up to two weeks. You will recieve a confirmation email once you've been granted access, however, in some instances the Gaussian permissions are activated a few days after you recieve the email.
{: .text-justify }

# **"Login and Setup HPCC ondemand"**

 Download the test input files (water.inp and AcCl.gjf) and neccessary submission script (submit.sh) [here](https://github.com/joegair/gair-group-docs/tree/main/assets/data/20240410_first_hpc_job/download). Navigate to [ondemand.hpcc.msu.edu](ondemand.hpcc.msu.edu). In the green banner select Files > Home Directory. Click the icon that says "New Directory" and enter "scripts" in the dialog box that pops up. Upload "submit.sh" to the scripts folder.
{: .text-justify }

Click the button that says "Open in Terminal". This will open a new window that shows a command line interface. Confirm that the command line prompt says `scripts`. Type `ls` into the interface and press return. You should see `submit.sh` in white text. Type `chmod u+x submit.sh` and press return. Type `ls` into the interface and press return again. Now you should see `submit.sh` in green font. If so, you have successfully enabled exectution permissions on `submit.sh`. Close out of the terminal tab and return to the on demand GUI tab. In the green banner select Files > Home Directory.
{: .text-justify }

Now we will create a testing directory to hold your first DFT calculations. Click "New Directory" and enter "my_first_dft_calcs". Then click upload and navigate to wherever you saved `water.inp` and `AcCl.gjf`, then upload them to "my_first_dft_calcs." Click "Open in Terminal". To the command line promp enter `submit.sh` and press return. You wil recieve a message to the effect of "Submited batch job"






