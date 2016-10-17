# Cups in Docker

The Docker image produced by this repo provides a docker container for CUPS configured to share an HP printer attached by USB.

## Init

```bash
# Build the container
./build.sh

# Run the container
./run.sh
```

## Additional steps

Run `docker exec -it cups passwd` to set the root password (necessary for authenticating to the web interface).

Browse to `https://<host_url>:631` and add the printer.

## Access from Linux

Add a printer with the following device URI:

	ipp://<host_url>:631/printers/<your_printer_name>

Make sure that the PPD file used by any local cups instance (e.g. `/etc/cups/ppd/<your_printer>.ppd`) has the following line commented out:

	*%cupsFilter: "application/vnd.cups-raster 0 hpcups"

The '%' character makes it a comment.

## Access from Windows

1. Got to `Control Panel -> Hardware and Sound -> Devices and Printers`
2. Right click and select `Add a printer`
3. Select `Add a network, wireless or Bluetooth printer`
4. Immediately select `The printer that I want isn't listed`
5. Choose `Select a shared printer by name` and specify `http://<host_url>:631/printers/<your_printer_name>`
7. Choose the appropriate driver.
8. (Optional) Print a test page.

