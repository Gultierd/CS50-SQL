
-- *** The Lost Letter ***
-- Getting informations about the missing package - it's ID
SELECT * FROM packages JOIN addresses ON packages.from_address_id = addresses.id WHERE address = "900 Somerville Avenue";
-- Checking scans of that given package - where it was picked up and dropped
SELECT * FROM scans WHERE package_id = "384";
-- Finding the address where the package was left
SELECT address, type FROM addresses WHERE id = "854";

-- *** The Devious Delivery ***
-- Checking the data on package with no "From" address
SELECT * FROM packages WHERE from_address_id IS NULL;
-- Looking for drop scan of that given package
SELECT * FROM scans WHERE package_id = "5098";
-- Checking for address in drop scan
SELECT address, type FROM addresses WHERE id = "348";

-- *** The Forgotten Gift ***
-- Checking the packages sent from 109 Tileston Street
SELECT * FROM packages JOIN addresses ON packages.from_address_id = addresses.id WHERE address = "109 Tileston Street";
-- Checking scans of that package
SELECT * FROM scans WHERE package_id = "9523";
-- Checking data on the driver
SELECT * FROM drivers WHERE id = 17;

