const fs = require('fs');

// Read the SQL file
fs.readFile('d1.sql', 'utf8', (err, data) => {
    if (err) {
        console.error('Error reading SQL file:', err);
        return;
    }

    // Extract table names and fields from the SQL file
    const regex = /CREATE TABLE `(.+?)` \(([\s\S]+?)\) ENGINE/g;
    let match;
    const tableFields = {};

    while ((match = regex.exec(data)) !== null) {
        const tableName = match[1];
          console.log(match[1]);return;
        const fieldRegex = / (.+?),/g;
        let fieldMatch;
        const fields = [];

        while ((fieldMatch = fieldRegex.exec(match[2])) !== null) {
            const fieldString = fieldMatch[1];
            const regex = /`(.+?)`\s+(.+)$/g;
            const match = regex.exec(fieldString);
            if (match) {
                const fieldName = match[1];
                // const fieldProperties = match[2].split(' ');
                const fieldProperties = match[2];

                const fieldObject = {
                    [fieldName]: fieldProperties
                };
                // console.log(fieldObject);
                fields.push(fieldObject);
            } else {
                console.log("Invalid field string.");
            };
        }

        tableFields[tableName] = fields;
    }

    // Log the generated object
      console.log(tableFields.contests);
});





/**************************
const fs = require('fs');
const path = require('path');

// Create the "code" directory if it doesn't exist
const directory = 'code';
if (!fs.existsSync(directory)) {
    fs.mkdirSync(directory);
}

// Read the SQL file
fs.readFile('d1.sql', 'utf8', (err, data) => {
    if (err) {
        console.error('Error reading SQL file:', err);
        return;
    }

    // Extract table names and fields from the SQL file
    const regex = /CREATE TABLE `(.+?)` \(([\s\S]+?)\)/g;
    let match;
    const tables = [];
    while ((match = regex.exec(data)) !== null) {
        console.log(match)
        const tableName = match[1];
        const fields = match[2]
            .trim()
            .split('\n')
            .map((field) => field.trim().split(' ')[0]);
        tables.push({ tableName, fields });
    }
    console.log(tables)

    // Generate models
    const models = tables.map(({ tableName, fields }) => {
        const modelName = tableName.charAt(0).toUpperCase() + tableName.slice(1);
        const properties = fields.map((field) => `${field};`).join('\n  ');
        return `
class ${modelName} {
  // Define model properties based on the table columns
  // Customize this section to match your requirements
  ${properties}

  constructor(data) {
    // Initialize model properties from data
    // Modify this section based on your column names and data types
    // ...
  }

  save() {
    // Save the model instance to the database
    // Implement the logic to insert/update data in the respective table
  }

  static getById(id) {
    // Retrieve a model instance by ID from the database
    // Implement the logic to fetch data from the respective table
  }

  static getAll() {
    // Retrieve all model instances from the database
    // Implement the logic to fetch data from the respective table
  }
}
`;
    });

    // Save the generated models to individual files inside the "code" directory
    models.forEach(({ tableName, model }, index) => {
        const modelName = tableName.charAt(0).toUpperCase() + tableName.slice(1);
        const filePath = path.join(directory, `${modelName}.js`);
        fs.writeFile(filePath, model, (err) => {
            if (err) {
                console.error(`Error writing ${modelName}.js file:`, err);
            } else {
                console.log(`${modelName}.js file generated successfully.`);
            }
        });
    });
});


**************************/