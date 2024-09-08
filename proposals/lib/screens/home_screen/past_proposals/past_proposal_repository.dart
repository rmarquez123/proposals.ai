import 'package:proposals/models/listem_items_bloc/list_items_repository.dart';
import 'package:proposals/screens/home_screen/past_proposals/past_proposal.dart';

class PastProposalsRepository
    implements ListItemsRepository<PastProposal, dynamic> {
  @override
  Future<List<PastProposal>> fetchItems(dynamic parameters) async {
    await Future.delayed(const Duration(seconds: 1)); 

    return [
      const PastProposal(  
        title: 'Assessing the Social and...',
        description: 'Edited 18m ago',
        lastModified: 'Dec 13, 2023',
        projectName: 'Adam Fisher and 4 more',
        files: 24,  
      ),
      const PastProposal(
        title: 'Advancements in Quantum...',
        description: 'Edited 8 days ago',
        lastModified: 'Dec 12, 2023',  
        projectName: 'Baker Mann and 5 more',
        files: 13,  
      ),
      const PastProposal(
        title: 'Advancements in Quantum...',
        description: 'Edited 8 days ago',
        lastModified: 'Dec 12, 2023',
        projectName: 'Baker Mann and 5 more',
        files: 13,
      ),
      // Add more mock proposals as needed
    ];
  }
}