import importlib.util
import os
import unittest


ROOT = os.path.dirname(os.path.dirname(__file__))
MODULE_PATH = os.path.join(ROOT, 'scripts', 'validate_data.py')


class DataQualityTests(unittest.TestCase):
    def setUp(self):
        self.assertTrue(os.path.exists(MODULE_PATH), 'Expected validation script to exist')
        spec = importlib.util.spec_from_file_location('validate_data', MODULE_PATH)
        self.module = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(self.module)

    def test_region_and_district_counts_are_valid(self):
        stats = self.module.collect_dataset_stats(ROOT)
        self.assertGreater(stats['regions'], 0)
        self.assertGreater(stats['districts'], 0)
        self.assertGreater(stats['towns'], 0)

    def test_schema_is_normalized(self):
        schema = self.module.get_normalized_schema()
        self.assertIn('region', schema)
        self.assertIn('district', schema)
        self.assertIn('town', schema)
        self.assertIn('name', schema['region'])
        self.assertIn('region_id', schema['district'])

    def test_validation_returns_no_critical_issues(self):
        issues = self.module.validate_dataset(ROOT)
        self.assertFalse(any(issue['severity'] == 'critical' for issue in issues))


if __name__ == '__main__':
    unittest.main()
