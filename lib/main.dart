import 'package:flutter/material.dart';
import 'package:my_market/my_market.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://hwfyhcnooyztitzdcsrq.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh3ZnloY25vb3l6dGl0emRjc3JxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzUwNTA4NjgsImV4cCI6MjA1MDYyNjg2OH0.Mp9CYWLQijmoLZ1D6p6fEv-FL0SUxwML8gfpT9Dekz4',
  );
  runApp(const MyMarket());
}
