# Raspberry pi configuration
A place for my raspberry pi set-up configuration. 

## Configuration Steps 

### 1. Install the o.s. in the SD card
Install [OSMC](https://osmc.tv/) in a SD card. The easier and faster way is using the instaler which could be found in the [download page](https://osmc.tv/download/mac/).

### 2. Finish the installation
Power up the rpi with the SD card which we just installed, and let the installation finishes.

### 3. Change the password
Change the default password for the defult user, which are:
<pre><code>user:     osmc
password: osmc
</pre></code>
By using this command:
<pre><code>passwd
</pre></code>

### 4. Install git
Update apt.
<pre><code>sudo apt-get update
</pre></code>

And install git:
<pre><code>sudo apt-get install git
</pre></code>


### 5. Fetch the needed scripts
Fetch the project in the raspberry pi. 
<pre><code>git clone https://github.com/rchauderlot/rpi-config.git
</pre></code>

