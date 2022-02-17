# Updating Your Repository for the AMD Theme

## **Important!** Logo update

When you apply the AMD Theme *prior to acquisition close*, your page will still show the Xilinx logo. This image is referencing a public file, so it has not yet been updated to the AMD logo. This is as expected. On the day of acquisition close, this will be updated to the AMD-Xilinx logo.

Currently shows:

<img style="background-color:black;" height=100 src="https://gitenterprise.xilinx.com/erinl/theme-tests/blob/main/xilinx-header-logo-blk.png?raw=true">
<p>

Will show on day of close:

<img style="background-color:black;" height=100 src="https://gitenterprise.xilinx.com/erinl/theme-tests/blob/main/21928600-A_AMD_Xilinx_Lockup_RGB_WHT_2.png?raw=true">

## Instructions for Updating your GitHub Pages Files

1. Clone the [theme repo](https://gitenterprise.xilinx.com/techdocs/sphinx_xilinx_theme) (or download a ZIP of the files).

 ```
git clone https://gitenterprise.xilinx.com/techdocs/sphinx_xilinx_theme.git
```

2. In your GitHub Pages branch, go to the directory where your markdown/rst files are sourced (the "source directory").
3. In the source directory, replace the following with the contents from the sphinx_xilinx_theme:

 ```
  /_ext
  /_static
  /templates
  /_themes/xilinx
  config.py
  ```

4. Make your HTML, and the new theme will be applied.
5. Publish your updated files.
