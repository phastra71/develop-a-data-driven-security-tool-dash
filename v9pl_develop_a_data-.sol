pragma solidity ^0.8.0;

contract DataDrivenSecurityToolDashboard {
    // Data Model
    struct Device {
        address deviceId;
        string deviceName;
        string deviceType;
        uint256 lastSeen;
        bool isConnected;
    }

    struct Alert {
        uint256 id;
        address deviceId;
        string alertType;
        string description;
        uint256 timestamp;
    }

    struct Vulnerability {
        uint256 id;
        string vulnerabilityName;
        string description;
        uint256 severity;
        uint256 timestamp;
    }

    struct SecurityMetric {
        uint256 id;
        string metricName;
        string description;
        uint256 value;
        uint256 timestamp;
    }

    // Mappings
    mapping(address => Device) public devices;
    mapping(uint256 => Alert) public alerts;
    mapping(uint256 => Vulnerability) public vulnerabilities;
    mapping(uint256 => SecurityMetric) public securityMetrics;

    // Arrays
    Device[] public deviceList;
    Alert[] public alertList;
    Vulnerability[] public vulnerabilityList;
    SecurityMetric[] public securityMetricList;

    // Functions
    function addDevice(address _deviceId, string memory _deviceName, string memory _deviceType) public {
        devices[_deviceId] = Device(_deviceId, _deviceName, _deviceType, block.timestamp, true);
        deviceList.push(Device(_deviceId, _deviceName, _deviceType, block.timestamp, true));
    }

    function addAlert(uint256 _deviceId, string memory _alertType, string memory _description) public {
        alerts[alertList.length] = Alert(alertList.length, _deviceId, _alertType, _description, block.timestamp);
        alertList.push(Alert(alertList.length, _deviceId, _alertType, _description, block.timestamp));
    }

    function addVulnerability(string memory _vulnerabilityName, string memory _description, uint256 _severity) public {
        vulnerabilities[vulnerabilityList.length] = Vulnerability(vulnerabilityList.length, _vulnerabilityName, _description, _severity, block.timestamp);
        vulnerabilityList.push(Vulnerability(vulnerabilityList.length, _vulnerabilityName, _description, _severity, block.timestamp));
    }

    function addSecurityMetric(string memory _metricName, string memory _description, uint256 _value) public {
        securityMetrics[securityMetricList.length] = SecurityMetric(securityMetricList.length, _metricName, _description, _value, block.timestamp);
        securityMetricList.push(SecurityMetric(securityMetricList.length, _metricName, _description, _value, block.timestamp));
    }
}