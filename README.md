# Overview

This is my take on a benchtop atx-based power supply. It has the following notable features:

* Switched outputs - The major output ports (3.3/5/12/-5/-12) are switched independently.
* LEDs connected to those outputs - A 3mm LED indicates which power ports are on.
* Fused lines - Each output line is fused. This is _likely_ not necessary with a high-quality ATX supply.
* 4-digit voltmeter/ammeter - And this particular part is far more accurate than I assumed it would be.
* Selector switch between positive outputs for voltemeter display.
* One selector option that functions as a free "voltmeter" of arbitrary voltage.
* Several USB ports for charging 5V devices. One USB port is connected to the voltmeter/ammeter.

# Mistakes I Made (things I might fix eventually)

My original design had a seperate "earth ground" pin, different from the ATX grounds. I did not realize, at the time,
that my ATX power supply connected its ground to earth ground. So this was pointless.

Although the 5V pin is switched, the metered USB port is not.  This is a little bit confusing. I think this would have
been easier to see without the "earth ground" post, as I could have located the metered USB port in the opeen spot where
that earth ground post was. Perhaps another option would have been to locate the 5V + metered USB at an extreme end of
the selector switch. I'm not sure of the exact solution here, but this interface causes occasional confusion.

For the LEDs in particular, you end up with a large number of low current grounds. I connected these on a piece of perf
board and it would have been nice to have piece of plastic to mount the board to, rather than simply hot-gluing it in
place.

One possible design "flaw" is that in this design is that the grounds and power are a significant distance from each other.
I do not use the ground + power dual-banana plugs, so this is not an issue for me.

I should have been more careful when selecting the current-limiting resistors for the LEDs. The "power on" and "standby"
LEDs are the wrong brightness level (power on should be brighter, but it's dimmer).

# Modifying the Print

This model was specifically designed for the parts I had on hand. It assumes the use of simple switches, 3mm LEDs, cheap ports, 
small fuse holders, and a particular switch. With that said, everything is designed in a fairly modular manner. You should
be able to modify different parts as you desire. Feel free to fork this and please share your modifications for others.

The `proto` variable is specifically designed to speed up non-final rendering for modifications. Set it to true while you're
positioning things, set it to false for your final print. 

I highly recommend small test-prints to determine what sizes you need for your various socketed parts.

Each panel part has basically been designed for the front panel to be flush with the x-y axis. The rather odd 180 degree
rotation for the final parts for final prints is just to simplify import of the resulting .stl to Cura.

# ATX PSU Caveats

This was designed for an older ATX power supply that had a -12V and -5V rails with useful-enough amperages (~1amp).
https://xdevs.com/doc/Standards/ATX/ATX12V_Power_Supply_Design_Guide_Rev1.1.pdf

This power supply also had fairly poor current supply on the VSB +5 V supply... too little to bother with an "always powered" usb port.
If your supply has this, I would consider re-wiring the USB ports to that supply.

Be careful about sense wires in your ATX-plug. The ATX 12V spec specifies that at least one of the 3.3V lines is a "sense line" for 
power supply regulation. If you've been overenthusiastic and already cut your wires, you can usually find this one by checking for
resistance between different 5V lines and different 3.3V lines, as there is usually a sense resistance of a few ohms. When you find them,
these sense wires should be directly tied back to the source lines, as they were in the original plug.

* We use the PS_ON connection to ground to control the power supply actually powering up.
* We use the +5 Volt-Standby (VSB) line from the PSU (the one that is powered up when the supply is not on) as an indicator that the
unit is wall-powered.
* We use PWR_OK line as the "on signal", rather than one of the 5V lines. This means that if the power-on LED is lit, the ATX supply
believes that it is supplying power correctly. I consider this okay because each output is independently signalling that it is
electrically active.

# Voltmeter/Ammeter Caveats

The voltmeters that I used here had 5 wires. Two thick "ammeter" wires and three thin "voltmeter wires". The design _requires_
that the ground for powering the voltmeter display is the same as the "low" side of the ammeter, effectively meaning that we must measure
current on the low side of our circuit.

* Thick Red Wire - Current Source (positive side) of the ammeter. Measured current actually flows "through" an ammeter, so this
                    thicker wire is to handle larger currents.
* Thick Black Wire - Output Current from ammeter - Connected to ground. Tied to the "non-metered" ground ports.
* Thin Red Wire - Power for the Voltmeter/Ammeter module - Connected to a PSU 5V line
* Thin Black Wire - Ground for Voltmeter, internally this is dead shorted to the Thick Black Wire. This can be removed.
* Thin Yellow Wire - This is the "sense" wire for the voltmeter. Very little current goes through here, and we are going to connect
                     this to our selector switch.

These voltmeters are often a little bit off, but have a potentiometer on the back that you can use to tune them.

# Parts I Used

* An old ATX power supply (very old)
* A small power switch... banggood no longer sells the model I bought from them.
* A pile (5) of SPST switches... I had a few lying around
    * but these have a similar look: https://www.amazon.com/dp/B07QGDDTWJ
* Binding Posts... I had some cheap ones similar to this on hand
    * https://www.ebay.com/itm/20Pc-Set-Binding-Post-Female-Socket-5color-For-4mm-Banana-Plug-Connector-Adapter/313333521267
    * https://www.amazon.com/gp/product/B07PFMD1N2
* 20mm Fuse holders and a selection of fuses
    * Make sure you buy the right size fuse for your fuse holders... or vice versa.
    * https://www.banggood.com/10pcs-10A-15A-Fuse-Holder-Case-Chassis-Panel-Mount-For-5-x-20mm-Glass-Tube-p-1312760.html
* Digital Voltmeter/Ammeter (4-digit version... but in retrospect that hardly matters)
    * https://www.banggood.com/5pcs-DC-100V-10A-0_28-Inch-Mini-Digital-Voltmeter-Ammeter-4-Bit-5-Wires-Voltage-Current-Meter-with-LED-Dual-Display-p-1470126.html
* USB ports
    * https://www.banggood.com/10pcs-USB-2_0-Female-Head-Socket-To-DIP-2_54mm-Pin-4P-Adapter-Board-p-1167634.html
* A 4-position selector switch. It is somewhat important that it be break-before-make
    * This is the most likely component you will have to rework for your print.
* Wire Connectors
    * 3-wire https://www.amazon.com/gp/product/B08FYHCXW8
    * 2-wire https://www.ebay.com/itm/2-3-Way-Spring-Lever-Terminal-Block-Electrical-Cable-Wire-Connector-Quick-Splice/124455323036
    * 1-wire https://www.amazon.com/gp/product/B06XH6WW4D and https://www.amazon.com/dp/B06XGYXVXR
* Misc Electronics stuff
    * Many resistors similar to
        * https://www.banggood.com/560-Pcs-1-ohm-to-10M-ohm-1-or-4W-5-pencent-Metal-Film-Resistor-56-Value-Assorted-Kit-p-1072159.html
    * Some 18-20 AWG hookup wire, and I used some 24AWG wire as well for the voltmeter hookup
    * Solder & Iron
    * Heatshrink and a way of shrinking it
    * 2 5mm LEDs
    * 5 3mm LEDs
    * I used a bit of PCB board as a "central ground" for all the LEDs. https://www.amazon.com/gp/product/B07CK3RCKS
* A few screws
    * 4 that fit your power supply and can be used to mount it
    * 6 to mount the front-panel onto the box

Parts I wished I used:
* An ATX extender plug. (https://www.amazon.com/StarTech-8-Inch-Power-Extension-ATX24POWEXT/dp/B000FL60AI/)
    * Trim those wires, and use the female connection as THE connector to the front panel. That leaves you with a simple, single
      connector to the power supply, and no modification to the power supply at all.

# Printing Instructions

* Open the "PSU Panel.scad" file with OpenSCAD.
     * Make sure proto=false unless you're editing the file. That setting is just to render faster when developing.
* Set target="text", render, and export an STL as "PanelText.stl" or something similar
* Set target="panel", render, and export an STL as "Panel.stl" or something similar
* Set target="box", render, export an STL as "Box.stl"

* Open your favorite slicer and open PanelText.stl (I use cura)
    * Disable Skirts/Rafts/etc.... but mostly your best first layer settings.
    * Slice and export a .gcode file, we'll say PanelText.gcode
    * If you're like me with a PEI bed, edit that gcode file to remove the "bed cooldown" and "print head cooldown" commands, leave em hot!
* Open another instance of your favorite slicer and open Panel.stl
    * Sanity check that the PanelText.stl is going to line up with the Panel.stl... Cura centers things and it should line up
    * Enable Z-hop, set the Z-hop height to at least 0.5 (I recommend a little higher... 0.6 maybe?)
    * Do not generate a skirt or raft or anything...
    * You can generate support... but be sure that your slicer isn't going to "support" in the holes for the text
    * Slice and export to Panel.gcode
    * If your slicer (like cura) makes a purge line in a consistent spot... move that purge line over in the X coordinates.
        For me that was replacing early "G1 X0.1 ... ; Move to start position" lines with "G1 X8.1..."
* Setup your text filament and begin printing.
* At the end of the print everything stays hot... swap filaments to your panel color and kick the panel print off.
    * This _should_ print the panel "around" your text, embedding it in the panel.

* After this is done and while you're fiddling with the electronic components, soldering and gluing... print the Box.

# Assembly Instructions
The use of Wago-style connectors makes this project significantly easier than it would be otherwise. The panel can be
completely assembled, and only afterwards plugged into the PSU. A better alternative design would be to buy an ATX extender
or expander, remove the male-plug, and connect all of the wires there.

What I actually did:
* Insert all of the Fuse olders and switches, and wire them, remembering the heat-shrink.
* Insert all of the banana plug sockets and wire them, leaving open connections for the LEDs, and remembering the heat-shrink.
* Insert of the LEDs and wire them, as well soldering open wires for the voltmeter switch to the three positive posts.
* Insert the metered USB port, negative is electrically common with the ammeter measuring port, positive with the positive 5V post.
* Insert the switch, solder the connections from the previous step and include the heatshrink.
* Place the voltmeter/ammeter and non-metered usb ports and wire them.
* Actually heatshrink everything.
* Insert the power switch and power/standby LEDs, heatshrink them.

The only thing that is non-obvious from the schematic and panel layout is probably the resistor locations.
In my case since both ends of the resistor were connected to components anchored to the panel, I simply
let them float between, with heatshrink around the exposed ends. Be aware of the calculated wattage of the
resistors you are using, quarter watt resistors are a little close for the 12V LED. (~12V * ~20mA = 0.24W,
note that this ignores the voltage drop from the LED, but there is some variation in both current and voltage
which makes this certainly too close for comfort)
