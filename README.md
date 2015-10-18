# Raspberry pi configuration
A place for my raspberry pi set-up configuration. 

## Configuration Steps 

###1. Install the OSMC in the SD card
Install [OSMC](https://osmc.tv/) raspberry pi distribution in a SD card. The easier and faster way is using the instaler which could be found in the [download page](https://osmc.tv/download/mac/).

###2. Finish the installation
Power up the rpi with the SD card which we just installed plugged in, and let the installation finishes.

###3. Change the password
Change the default password for the default user, which are:
<pre><code>user:     osmc
password: osmc
</code></pre>
By using this command:
<pre><code>passwd
</code></pre>

###4. Configure the remote
In my case I built a IR recevier using a TSOP4838 connected to the GPIO pin 18 folloing the instrucuctions in the raspberry pi learn page [Using an IR Remote with a Raspberry Pi Media Center](https://learn.adafruit.com/using-an-ir-remote-with-a-raspberry-pi-media-center/overview). But, I've just back-up that info [here](lircd/README.md) just in case.

This setup is supported by the OSMC distribution out of the box, but if you need to use any other pin you could choose it in the menu *My OSMC* > *Pi Configuration* > *Hardware Support* > *gpio_in_pin*. If the GPIO is not configure we could just enable in *My OSMC* > *Pi Configuration* > *Hardware Support* > *Enable LIRC GPIO support*

At this point we only need to select the remote key map we want to use in the menu *My OSMC* > *Remotes*. I've selected the *samsung-lircd* config file because I'm going to use my Samsung TV remote.

I've also uploaded the [lircd.conf](lircd/lircd.conf) file for my Samsung TV remote just in case I'll need to use another Raspberry Pi distribution that has not it included.

To install a custom configuration in the OSMC distribution you could install it by running the following commands and selecting as it were a native remote as descrived avobe.
<pre><code>sudo cp rpi-config/lircd/lircd.conf /etc/lirc/custom-samsung-lircd.conf
sudo cp /etc/lirc/samsung-lircd.png /etc/lirc/custom-samsung-lircd.png</code></pre>

###5. Install the MPEG-2 and VC-1 license codes

We just need to add two lines to the *config.txt* file in the SD filesystem root directory.
<pre><code>decode_MPG2=0000000000
decode_WVC1=0000000000
</code></pre>
The 0000000000 portion of the license is your unique 10-digit alphanumeric license code.

We have 3 ways to add those lines:

* Mount the SD card in a computer and add those two lines to the *config.txt* file with an editor.
* Editing it in the rpi using a ssh session and executing the command:<pre><code>sudo nano /boot/config.txt</code></pre> and rebooting. 
* Use the OSMC config.txt editor found in *MyOSMC* > *Pi Config* > *Config Editor* > *Open Config.txt Editor*.


###6. Update OSMC

Check if is there any update availabe by: *My OSMC* > *Updates* > *Manual Controls* > *Scan for updates now*.

###7. Install PlexBMC

Install the PleXBMC plugin to integrate the XBMC installed in OSMC with my [PLEX Media Server](https://plex.tv/) installed in my main computer (maybe installed in a NAS in the future). Full instructions could be found in the [kodi plugin wiki page](http://kodi.wiki/view/Add-on:PleXBMC), but these are the main steps:

1. Fetch the PleXBMC repository file in a ssh session by executing the following command:
<pre><code>wget http://hippojay.github.io/repository.plexbmc.addons/download/repository.plexbmc.addons/repository.plexbmc.addons-3.0.0.zip
</code></pre>

2. Navigate in the XBMC ui through the menu *Settings* > *Add-ons* > *Install from zip file* > *Home directory* and select the previuously uploaded file *repository.plexbmc.addons-3.0.0.zip* to install the the PleXBMC repository.

3. Install PleXBMC: *Settings* > *Add-ons* > *Get Add-ons* > *PleXBMC Add-ons for XBMC* > *Video Add-ons* > *PleXBMC* > *Install*

4. Install PleXBMC Helper : *Settings* > *Add-ons* > *Get Add-ons* > *PleXBMC Add-ons for XBMC* > *Services* > *PleXBMC Helper* > *Install*

5. Install the Amber skin. This skin is integrated with PleXBMC including a special mode to be optimized for using that plugin. Go to *Settings* > *Apparence* > *Skin* > *Skin* > *Get more..*, find the *Ambar* skin and install and activate it.

6. Exit to the main menu and choose the secondary option *Settings/Go to plex*

###8. Install mjg-streamer

1. Install git:

	Update apt.
	<pre><code>sudo apt-get update
	</code></pre>

	And install git:
	<pre><code>sudo apt-get install git
	</code></pre>


2. Fetch the project in the raspberry pi. 
	<pre><code>git clone https://github.com/rchauderlot/rpi-config.git
	</code></pre>

3. Run the install script. 
	<pre><code>rpi-config/mjpg-streamer/install-mjpg-streamer.sh
	</code></pre>
	
4. Configure the previous script using the info provided by the following script until you get the mjpg-streamer working.
	<pre><code>rpi-config/mjpg-streamer/list_webcam_formats.sh</code></pre>
	
5. Configure the script located at *rpi-config/mjpg-streamer/init/mjpg-streamer* as well and install the service by executing the following command:
	<pre><code>rpi-config/mjpg-streamer/install-mjpg-streamer-service.sh</code></pre>

6. Just in case you want to uninstall the service I made another srcipt for that purpose:
	<pre><code>rpi-config/mjpg-streamer/uninstall-mjpg-streamer-service.sh</code></pre> 

###9. Install ddclient to update a ddns service

To do this step you will need to be registered before in a ddns service (i.e: [no-ip](http://www.noip.com/))

Install the ddns client through:
<pre><code>sudo apt-get install ddclient</code></pre>

It will ask you for the configuration durring the install process. To check if everything was ok you could check the config file:

<pre><code>sudo cat /etc/ddclient.conf</code></pre>

An example of the content of the ddclient.conf file is:

<pre><code># Configuration file for ddclient generated by debconf
#
# /etc/ddclient.conf

protocol=dyndns2
use=web, web=checkip.dyndns.com/, web-skip='IP Address'
server=dynupdate.no-ip.com
login=your-no-ip-login-email@gmail.com
password='your-no-ip-password'
your-no-ip-domain.ddns.net
</code></pre>

After any change, save the file and then restart ddclient.

<pre><code>sudo service ddclient restart</code></pre>