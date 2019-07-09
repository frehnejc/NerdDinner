Tutorial – Migrate an already running .Net 4 legacy app backed by SQL on Windows 2008 R2 to Azure App Services
==============================================================================================================

Part 1 - Migrate Legacy App to Azure App Services (without original code)
-------------------------------------------------------------------------

### Pre-Tasks for the Source Database Environment

You will need to setup your environment with SQL 2008 R2. I set this up on a
Windows Server 2008 R2 Server with SQL 2008 R2 Database, both platforms will be
out of support soon. Clone the source code from
[here](https://github.com/frehnejc/NerdDinner), you will use the provided DB
Creation Scripts to create the two databases. To create the databases:

1.  Start SQL Server Management Studio.

2.  Starting with the first Database “aspnet-NerdDinner” start a new SQL Query
    and paste the contents from the aspnet-script.sql file and execute the
    query, this will create the DB and data.

3.  Repeat the same process by replacing the sql script in your query editor
    with the Context-script.sql, this will create the “NerdDinnerContext” DB.

4.  You will have two databases and tables as shown below:

![](media/e7e5ea35964a4bfd1838c15afbca1298.png)

### Pre-Tasks for the Source IIS Web App Environment

Build a 2008 R2 Server with IIS. Clone the source code from
[here](https://github.com/frehnejc/NerdDinner). Ensure you edit the web.config
with the credentials to connect to your DB Server created with steps above. If
you wantBuild and deploy to your IIS Server by following these steps:

1.  Remove your default website in IIS.

2.  Start a local Visual Studio and run a build and ensure that your app works
    locally, ensure that the database connection is successful by clicking the
    link on the landing page “View all Upcoming Dinners”. All 3 Dinners should
    show. If successful go to the next step.

3.  Create a release by Right Clicking on the NerdDinner Application and
    selecting Publish:

![](media/6ccbad3b0d4606fd7c7046c94090874b.png)

4.  Then Select Publish:

![](media/6e9126bcdf7068f32fbca9bf6b2d0d17.png)

5.  Copy the contents of the release folder NerdDinner\\bin\\Release\\Publish to
    a folder on your IIS Server under C:\\NerdDinner.

6.  Add a new Site in IIS:

    ![](media/e06d1080a31e463ac63af7cf4d060d40.png)

    1.  Select the options as below then click OK:

        ![](media/ae5e25a89c10c06201c4bc68285c3fbc.png)

    2.  Modify the app pool and set the .Net Framework version from 2.0 to 4.0:

    ![](media/948d75d33454b56341f78e8df23040c1.png)

7.  Ensure the App works by browsing to it as <http://localhost>. Ensure you
    validate that the database connection is successful by clicking the link on
    the landing page “View all Upcoming Dinners”. All 3 Dinners should show.

### Build your Hybrid Connection Manager Machine

Build a Windows 2016 or higher machine as your on premises Hybrid Connection
Manager.

### Overview

This will be a two-part migration, first we will migrate the App to Azure App
Services and create a Hybrid Connection back to the existing on-premises
database. This leaves the original app server untouched.

The second part of the migration we will focus on migrating the database used by
the app using Azure Data Migration Assistant (DMA) to Azure SQL.

### Before App Migration

![](media/b6d46198068247994c1756b36ec581c6.png)

### After App Migration

![](media/ab2386e32eeb57b203ab36da8dae58d5.png)

### Detailed Steps

1.  Download and install the App Service Migration Assessment tool available
    from [here](https://appmigration.microsoft.com/readiness) on the server that
    is running the NerdDinner Sample app.

2.  Run the Azure App Service Migration Assistant shortcut that is placed on
    your desktop. You will be presented with “Choose a Site”:

![](media/d486a9f6ed021dd7fe03c41cfbcf450a.png)

3.  Select the NerdDinner site and click Next, the site will be assessed for
    compatibility with Azure App Services. There will be two warnings that can
    be ignored as the app will safely migrate across, you can save the report so
    you can fix them later.

![](media/efd04a36d54538c2f0c7899c902853cd.png)

4.  Click Next and enter your credentials to the Azure Portal by copying the
    Device Code and opening the Browser, copy the code and enter your
    credentials to Azure.

![](media/cf50ae6d50d491859fd8c6013b5dba16.png)

5.  Once logged into Azure via the Browser you can close it.

6.  Select an existing or new resource group, a new Destination Site Name,
    Region and leave the option selected to Set up hybrid connection to enable
    database connection, below is a sample:

![](media/38c1aa3bee2d4586343e1f2ca69db253.png)

7.  Select Migrate, the migration starts with a progress report:

![](media/b159b9e6405cc654ea93885f83dd8fd9.png)

8.  When the migration is complete, the new Azure resources will be created as
    shown below:

![](media/ac3f9032aefbbbb2b4a763796ba34829.png)

9.  On your Server 2016 machine allocated as the Hybrid Connection Manager
    install the HCM from
    [here](https://www.microsoft.com/en-au/download/details.aspx?id=42962).

10.  Start the Hybrid Connection Manager UI, click the Add a new Hybrid
    Connection Link, and logon to your subscription, and select the newly
    created endpoint and then save:

![](media/4a66df6e6356fe817c2ed2741d7b7c5f.png)

11.  You should have a status of “Connected”:

![](media/cd1c7b1deec34cadfcf9416e8c28b13f.png)

12.  Test your newly created app by browsing to the URL as shown in the Azure
    Portal:

![](media/0d681bfed521dd287aaf541e7a50d6bc.png)

13.  To test the database connection, click the link “View All Upcoming Dinners”:

![](media/b5967356e5a90dcf944f24c5d8aebea2.png)

14.  This validates that the Hybrid Connection is working successfully so should
    show all dinners.

15.  You can scale down the App Service plan to save on costs as the default Plan
    is P1V2 so you can scale down to B1.



References
==========

<https://appmigration.microsoft.com/readinesschecks>

<https://docs.microsoft.com/en-us/azure/app-service/app-service-hybrid-connections>

<https://azure.microsoft.com/en-au/blog/introducing-the-app-service-migration-assistant-for-asp-net-applications/>

<https://docs.microsoft.com/en-us/sql/dma/dma-overview>

### Disclaimer:
All views expressed on this post are that of my own and do not represent the opinions of any entity whatsoever with which I have been, am now, or will be affiliated.
